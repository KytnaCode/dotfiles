{
  lib,
  config,
  ...
}: {
  options.custom.sound.enable = lib.mkEnableOption "enable dotfiles' sound config";

  config = lib.mkIf config.custom.sound.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
    };
  };
}
