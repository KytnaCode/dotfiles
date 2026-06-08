{apps, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  options.custom.programs.zellij.enable = lib.mkEnableOption "enable zellij";

  config = lib.mkIf config.custom.programs.zellij.enable {
    home.packages = [pkgs.zellij];

    xdg.configFile."zellij".source = apps.zellij;
  };
}
