{
  outputs = {self, ...}: {
    nvim = self + "/nvim";
    kitty = self + "/kitty";
  };
}
