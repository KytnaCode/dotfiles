{
  outputs = {self, ...}: {
    nvim = self + "/nvim";
    kitty = self + "/kitty";
    hyprland = self + "/hyprland";
    zsh.zshrc = self + "/zsh/.zshrc";
  };
}
