{
  lib,
  config,
  ...
}: {
  options.custom.hardware.sound.enable = lib.mkEnableOption "enable dotfiles' sound config";

  config = lib.mkIf config.custom.hardware.sound.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
    };
  };
}
