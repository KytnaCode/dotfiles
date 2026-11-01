{
  inputs,
  apps,
  ...
}: {
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
in {
  options.custom.programs.yazi.enable = mkEnableOption "enable yazi";

  config = mkIf config.custom.programs.yazi.enable {
    home.packages = [
      inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    xdg.configFile."yazi".source = apps.yazi;
  };
}
