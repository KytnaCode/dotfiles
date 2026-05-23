{apps}: {
  neovim = import ./neovim.nix {inherit apps;};
  kitty = import ./kitty.nix {inherit apps;};
}
