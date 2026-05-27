{
  config,
  lib,
  ...
}: {
  options.custom.programs.direnv.enable = lib.mkEnableOption "enable direnv and nix-direnv";

  config = lib.mkIf config.custom.programs.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      stdlib = ''
        nix_direnv_manual_reload
      '';
    };
  };
}
