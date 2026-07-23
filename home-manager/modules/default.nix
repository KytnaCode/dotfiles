{
  apps,
  inputs,
}: {
  direnv = ./direnv.nix;
  git = import ./git.nix {inherit apps;};
  input = ./input.nix;
  hyprland = import ./hyprland.nix {inherit apps inputs;};
  kitty = import ./kitty.nix {inherit apps;};
  neovim = import ./neovim.nix {inherit apps inputs;};
  registries = import ./registries.nix {};
  starship = import ./starship.nix {inherit apps;};
  zellij = import ./zellij.nix {inherit apps;};
  zsh = import ./zsh.nix {inherit apps;};
}
