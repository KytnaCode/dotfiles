{
  apps,
  inputs,
  ...
}: {
  lib,
  config,
  pkgs,
  ...
}: {
  options.custom.programs.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config = lib.mkIf config.custom.programs.hyprland.enable {
    xdg.configFile."hypr".source = apps.hyprland;

    home.packages = with pkgs; [
      swaynotificationcenter
      mpvpaper
      inputs.hyprquickshot.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
