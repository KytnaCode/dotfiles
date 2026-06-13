{modules, ...}: {...}: {
  imports = with modules;
    [
      direnv
      git
      hyprland
      kitty
      neovim
      starship
      zellij
      zsh
    ]
    ++ [
      ./programs.nix
      ./mime.nix
      ./fonts.nix
    ];

  programs.home-manager.enable = true;

  nix.registry.templates = {
    exact = true;
    from = {
      type = "indirect";
      id = "templates";
    };
    to = {
      type = "github";
      owner = "kytnacode";
      repo = "templates";
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
