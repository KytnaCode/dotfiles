{
  description = "Dotfiles development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    formatter.default = pkgs.alejandra;

    devShells.${system}.default = pkgs.mkShellNoCC {
      buildInputs = with pkgs; [
        git
        git-credential-oauth
        nixd
        alejandra
        lua-language-server
        just
      ];
    };
  };
}
