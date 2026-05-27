{pkgs, ...}: {
  custom.programs = {
    direnv.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    kitty.enable = true;

    hyprland.enable = true;

    zsh.enable = true;

    starship.enable = true;
  };

  home.packages = with pkgs; [
    brave
    zotero
  ];
}
