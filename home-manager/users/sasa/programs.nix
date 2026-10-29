{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "code"
      "discord"
      "discord-unwrapped"
      "geogebra"
      "google-chrome"
      "spotify"
      "steam"
      "steam-unwrapped"
      "vscode"
    ];

  custom.programs = {
    kitty.enable = true; # Terminal emulator.

    starship.enable = true; # Shell theme.

    zsh.enable = true; # Shell.
  };

  home.packages = with pkgs; [
    # Productivity
    google-chrome # Browser.
    inkscape # SVG Editor.
    kdePackages.okular # Document viewer.
    krita # Drawing software.
    libreoffice-qt6 # Office suite.
    manuskript # Novel writhing app.
    scribus # Publishing software.
    thunderbird # Email client.

    # Study
    anki # Flashcards.
    geogebra # Graphing calculator.

    # Utilities
    gparted # Disk management.
    kdePackages.dolphin # File browser.
    kdePackages.gwenview # Image viewer.
    kdePackages.plasma-systemmonitor # System monitor.
    kooha # Screen recorder.
    ksnip # Screenshot taking.
    localsend # Share files fast.
    vicinae # App launcher.

    # Games & Entertainment
    gamemode # Optimize game performance on demand.
    heroic # Epic and GOG games launcher.
    kodi # Media center.
    retroarch # Emulators.
    spotify # Music.
    steam

    # Programming
    python3
    (vscode.fhsWithPackages (p: with p; [python3 bubblewrap]))
  ];
}
