{pkgs, ...}: {
  custom.programs = {
    direnv.enable = true;

    git.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    kitty.enable = true;

    hyprland.enable = true;

    zsh.enable = true;

    starship.enable = true;

    tmux.enable = true;
  };

  home.packages = with pkgs; [
    brave
    zotero
    signal-desktop
  ];
}
