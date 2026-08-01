{
  outputs = {self, ...}: {
    bat = self + "/bat";
    nvim = self + "/nvim";
    kitty = self + "/kitty";
    hyprland = self + "/hyprland";
    zsh = {
      zshrc = self + "/zsh/.zshrc";
      plugins = self + "/zsh/.zsh_plugins.txt";
    };
    starship = self + "/starship/starship.toml";
    git = {
      config = self + "/git/config";
      ignorefile = self + "/git/global.gitignore";
    };
    tmux = self + "/tmux";
    xdg-desktop-portal.hyprland = self + "/xdg-desktop-portal/hyprland-portals.conf";
    zellij = self + "/zellij";
  };
}
