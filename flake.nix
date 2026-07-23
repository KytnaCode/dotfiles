{
  description = "Dotfiles development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    formatter.${system} = pkgs.alejandra;

    devShells.${system}.default = pkgs.mkShellNoCC {
      buildInputs = with pkgs; [
        # Nix
        alejandra
        statix
        deadnix
        nixd

        # Git
        git
        git-credential-oauth

        # Lua
        lua-language-server
        stylua
        selene

        # Python
        python3

        # Misc
        just
      ];
    };
  };
}
