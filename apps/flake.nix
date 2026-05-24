{
  outputs = {self, ...}: {
    nvim = self + "/nvim";
    kitty = self + "/kitty";
    hyprland = self + "/hyprland";
    zsh = {
      zshrc = self + "/zsh/.zshrc";
      plugins = self + "/zsh/.zsh_plugins.txt";
    };
  };
}
