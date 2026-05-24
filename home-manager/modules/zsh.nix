{apps, ...}: {
  pkgs,
  lib,
  config,
  ...
}: {
  options.custom.programs.zsh.enable = lib.mkEnableOption "enable zsh";

  config = lib.mkIf config.custom.programs.zsh.enable {
    programs.zsh.enable = true;

    home.file = {
      ".zshrc".source = apps.zsh.zshrc;

      ".zsh_plugins.txt".source = apps.zsh.plugins;
      
      ".nix-overrides.zshrc".text = ''
        export DISABLE_AUTO_UPDATE="true"
      '';
      
      ".variables.zsh".text = ''
        export ZSH_CUSTOM_ANTIDOTE_PATH="${pkgs.antidote}/share/antidote/antidote.zsh" 
      '';
    };
  };
}
