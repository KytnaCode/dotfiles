{apps, ...}: {
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
in {
  options.custom.programs.yamlfmt = {
    enable = mkEnableOption "enable yamlfmt";
    globalConfig = mkEnableOption "enable global yaml config";
  };

  config = let
    cfg = config.custom.programs.yamlfmt;
  in
    mkIf cfg.enable {
      home.packages = [
        pkgs.yamlfmt
      ];

      xdg.configFile."yamlfmt".source = mkIf cfg.globalConfig apps.yamlfmt;
    };
}
