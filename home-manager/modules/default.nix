{apps}: {
  direnv = ./direnv.nix;
  git = import ./git.nix {inherit apps;};
  hyprland = import ./hyprland.nix {inherit apps;};
  kitty = import ./kitty.nix {inherit apps;};
  neovim = import ./neovim.nix {inherit apps;};
  starship = import ./starship.nix {inherit apps;};
  zsh = import ./zsh.nix {inherit apps;};
}
