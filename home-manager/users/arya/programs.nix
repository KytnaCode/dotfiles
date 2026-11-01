{pkgs, ...}: {
  # Managed by custom modules.
  custom.programs = {
    bat.enable = true;

    direnv.enable = true; # direnv and nix-direnv.

    git.enable = true; # VCS.

    hyprland.enable = true; # Window manager.

    kitty.enable = true; # Terminal emulator.

    neovim = {
      # My main editor.
      enable = true;
      defaultEditor = true; # Set EDITOR environment variable.
    };

    ssh = {
      enable = true; # Enable ssh config.
      sshfs.enable = true; # Install sshfs.
      ssh-agent.enable = true; # Enable ssh-agent.
    };

    starship.enable = true; # Shell theme.

    tmux.enable = true; # Better terminal multiplexer.

    yamlfmt = {
      enable = true;
      globalConfig = true;
    };

    yazi.enable = true;

    zellij.enable = false; # Terminal multiplexer.

    zsh.enable = true; # My shell.
  };

  services = {
    gnome-keyring.enable = true;

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
    onlyoffice-desktopeditors # Office suite.
    manuskript # Novel writing software.
    zettlr # Academic writing software.
    filen-desktop # Cloud storage.
    filen-cli # Cloud storage.

    # Communication
    signal-desktop # Messaging app.
    discord # Messaging app.

    # Entertainment
    spotify # I cannot live without music.

    # Studying
    anki # Flashcards.

    # Util
    fzf # Fuzzy search.
    harper # Spell checker.
    jq # Work with JSON in terminal.
    sshfs # Very handy for editing remote files.
    zoxide # Smart cd
    beanquery # Required by obsidian's plugin "beancount ledger".
    beanprice # Same as above.

    # System
    bluetui # Bluetooth tui.
    impala # Network tui.
    btop # Resource monitor.
    libnotify # notify-send command.
    podman-compose # Containers.
    wl-clipboard # Copy and paste from terminal.
    libsecret
    texliveBasic
  ];
}
