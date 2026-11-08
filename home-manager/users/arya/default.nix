{modules, ...}: {lib, ...}: {
  imports = with modules;
    [
      bat
      direnv
      git
      hyprland
      input
      kitty
      languagetool
      neovim
      registries
      ssh
      starship
      tmux
      yamlfmt
      yazi
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
      "firefox-esr-140-bin-unwrapped" # TODO: Remove after upgrade to Zotero 11.
    ];

  nixpkgs.config.permittedInsecurePackages = [
    "firefox-esr-140-bin-unwrapped-140.17.0esr" # TODO: Remove after upgrade to Zotero 11.
  ];

  nix.settings = {
    extra-substituters = ["https://yazi.cachix.org"];
    extra-trusted-public-keys = ["yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="];
  };

  custom = {
    registries.templates.enable = true;

    input.fcitx5 = {
      enable = false;
      japaneseKeyboard = true;
    };

    services.language-tool.enable = true;
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
