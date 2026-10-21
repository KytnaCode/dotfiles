{
  outputs = {self, ...}: {
    bat = self + "/bat";
    git = {
      config = self + "/git/config";
      ignorefile = self + "/git/global.gitignore";
    };
    hyprland = self + "/hyprland";
    kitty = self + "/kitty";
    nvim = self + "/nvim";
    ssh = self + "/ssh/config";
    starship = self + "/starship/starship.toml";
    tmux = self + "/tmux";
    xdg-desktop-portal.hyprland = self + "/xdg-desktop-portal/hyprland-portals.conf";
    yamlfmt = self + "/yamlfmt";
    zellij = self + "/zellij";
    zsh = {
      zshrc = self + "/zsh/.zshrc";
      plugins = self + "/zsh/.zsh_plugins.txt";
    };
  };
}
