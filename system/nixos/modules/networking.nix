{
  config,
  lib,
  ...
}: {
  options.custom.networking.enable = lib.mkEnableOption "enable networking";

  config = lib.mkIf config.custom.networking.enable {
    networking.networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

    networking.wireless.iwd = {
      enable = true;
      settings = {
        Network = {
          EnableIPv6 = true;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };
}
