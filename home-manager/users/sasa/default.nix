{modules, ...}: {...}: {
  imports = with modules;
    [
      input
      kitty
      starship
      zsh
    ]
    ++ [
      ./programs.nix
    ];

  custom.input.fcitx5 = {
    enable = true;
    japaneseKeyboard = true;
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
