{apps, ...}: {
  lib,
  config,
  pkgs,
  ...
}: {
  options.custom.programs.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config = lib.mkIf config.custom.programs.hyprland.enable {
    home.file.".config/hypr".source = apps.hyprland;

    home.packages = [pkgs.swaynotificationcenter];
  };
}
