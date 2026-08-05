{
  apps,
  inputs,
}: {
  bat = import ./bat.nix {inherit apps;};
  direnv = ./direnv.nix;
  git = import ./git.nix {inherit apps;};
  input = ./input.nix;
  hyprland = import ./hyprland.nix {inherit apps inputs;};
  ssh = import ./ssh.nix {inherit apps;};
  kitty = import ./kitty.nix {inherit apps;};
  neovim = import ./neovim.nix {inherit apps inputs;};
  registries = import ./registries.nix {};
  starship = import ./starship.nix {inherit apps;};
  tmux = import ./tmux.nix {inherit apps;};
  zellij = import ./zellij.nix {inherit apps;};
  zsh = import ./zsh.nix {inherit apps;};
}
