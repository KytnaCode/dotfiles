{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprquickshot = {
      url = "github:jamdon2/hyprquickshot";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apps.url = "../apps";
  };

  outputs = inputs @ {apps, ...}: let
    modules = import ./modules {inherit apps inputs;};
  in {
    # Users in ./users need to be not a module but a higher order function that accept `modules` and possibly other
    # internal parameters and return the final home-manager module.
    homeManagerModules = {
      arya = import ./users/arya {inherit modules;};
      sasa = import ./users/sasa {inherit modules;};
    };
  };
}
