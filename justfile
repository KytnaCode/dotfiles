nix-update:
  nix flake update --flake ./system/nixos dotfiles-hm apps

nix-update-full:
  nix flake update --flake ./system/nixos

nix-reload: nix-update
  sudo nixos-rebuild switch

fmt:
  nix fmt .
  stylua .
