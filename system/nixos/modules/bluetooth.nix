{
  config,
  lib,
  pkgs,
  ...
}: {
  options.custom.hardware.bluetooth = {
    enable = lib.mkEnableOption "enable bluetooth support";

    sound.switchOnConnect = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = let
    cfg = config.custom.hardware.bluetooth;
  in
    lib.mkIf cfg.enable {
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
          General = {
            Enable = "Source,Sink,Media,Socket";
          };
        };
      };

      services.pulseaudio = {
        extraConfig = lib.mkIf cfg.sound.switchOnConnect ''
          load-module module-switch-on-connect
        '';

        package = lib.mkDefault pkgs.pulseaudioFull;
      };
    };
}
