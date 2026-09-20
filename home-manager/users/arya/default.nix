{modules, ...}: {lib, ...}: {
  imports = with modules;
    [
      bat
      direnv
      git
      hyprland
      input
      kitty
      neovim
      registries
      ssh
      starship
      tmux
      zellij
      zsh
    ]
    ++ [
      ./programs.nix
      ./mime.nix
      ./fonts.nix
    ];

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "lunacy"
      "obsidian"
      "spotify"
      "discord"
      "discord-unwrapped"
    ];

  custom = {
    registries.templates.enable = true;

    input.fcitx5 = {
      enable = false;
      japaneseKeyboard = true;
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
}
