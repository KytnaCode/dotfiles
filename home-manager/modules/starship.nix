{apps, ...}: {
  config,
  lib,
  ...
}: {
  options.custom.programs.starship.enable = lib.mkEnableOption "enable starship";

  config = lib.mkIf config.custom.programs.starship.enable {
    programs.starship.enable = true;

    xdg.configFile."starship.toml".source = apps.starship;
  };
}
