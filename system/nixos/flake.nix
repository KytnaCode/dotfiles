{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apps.url = "../../apps";

    dotfiles-hm = {
      url = "../../home-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
        apps.follows = "apps";
      };
    };
  };
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    dotfiles-hm,
    ...
  }: let
    custom = import ./modules;
  in {
    # NOTE: 'nixos' is the default hostname
    nixosConfigurations = {
      arya-pc = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        modules = [
          home-manager.nixosModules.default
          ./systems/arya-pc/configuration.nix
        ];

        specialArgs = {inherit system inputs dotfiles-hm custom;};
      };

      LesbaMovil = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        modules = [
          home-manager.nixosModules.default
          ./systems/LesbaMovil/configuration.nix
        ];

        specialArgs = {inherit system inputs dotfiles-hm custom;};
      };
    };
  };
}
