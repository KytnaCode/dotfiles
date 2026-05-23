{
  outputs = {self, ...}: {
    nvim = self + "/nvim";
    kitty = self + "/kitty";
    hyprland = self + "/hyprland";
  };
}
