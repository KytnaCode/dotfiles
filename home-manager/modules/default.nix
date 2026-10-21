{
  apps,
  inputs,
}: {
  bat = import ./bat.nix {inherit apps;};
  direnv = ./direnv.nix;
  git = import ./git.nix {inherit apps;};
  hyprland = import ./hyprland.nix {inherit apps inputs;};
  input = ./input.nix;
  kitty = import ./kitty.nix {inherit apps;};
  neovim = import ./neovim.nix {inherit apps inputs;};
  registries = import ./registries.nix {};
  ssh = import ./ssh.nix {inherit apps;};
  starship = import ./starship.nix {inherit apps;};
  tmux = import ./tmux.nix {inherit apps;};
  yamlfmt = import ./yamlfmt.nix {inherit apps;};
  zellij = import ./zellij.nix {inherit apps;};
  zsh = import ./zsh.nix {inherit apps;};
}
