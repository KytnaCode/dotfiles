{pkgs, ...}: {
  # Managed by custom modules.
  custom.programs = {
    direnv.enable = true; # direnv and nix-direnv.

    git.enable = true; # VCS.

    # My main editor.
    neovim = {
      enable = true;
      defaultEditor = true; # Set EDITOR environment variable.
    };

    kitty.enable = true; # Terminal emulator.

    hyprland.enable = true; # Window manager.

    zsh.enable = true; # My shell.

    starship.enable = true; # Shell theme.

    zellij.enable = true; # Terminal multiplexer.
  };

  services = {
    hyprpolkitagent.enable = true; # Enable hyprpolkitagent.

    podman.enable = true; # Enable podman for development.
  };

  home.packages = with pkgs; [
    # Productivity
    brave # Old browser, migrating to floorp.
    floorp-bin # Browser.
    lunacy # UI Design.
    obsidian # Note taking.
    zotero # Academic research.

    # Communication
    signal-desktop # Messaging app.

    # Enterteinment
    spotify # I cannot live without music.

    # Studying
    anki # Flashcards.

    # Util
    fzf # Fuzzy search.
    zoxide # Smart cd
    harper # Spell checker.

    # System
    btop # Resource monitor.
    libnotify # notify-send command.
    podman-compose # Containers.
    wl-clipboard # Copy and paste from terminal.
  ];
}
