{apps, ...}: {
  lib,
  config,
  ...
}: {
  options.custom.programs.zsh.enable = lib.mkEnableOption "enable zsh";

  config = lib.mkIf config.custom.programs.zsh.enable {
    programs.zsh.enable = true;

    home.file = {
      ".zshrc".source = apps.zsh.zshrc;
      ".nix-overrides.zshrc".text = ''
        export DISABLE_AUTO_UPDATE="true"
      '';
    };
  };
}
