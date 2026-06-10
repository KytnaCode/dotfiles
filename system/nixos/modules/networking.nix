{
  config,
  lib,
  ...
}: {
  options.custom.networking = {
    enable = lib.mkEnableOption "enable networking";
    enableWireless = lib.mkEnableOption "enable wireless networking";
  };

  config = let
    inherit (lib) mkIf;

    cfg = config.custom.networking;
  in
    mkIf cfg.enable {
      networking.networkmanager = {
        enable = true;
        wifi.backend = "iwd";
      };

      networking.wireless.iwd = mkIf cfg.enableWireless {
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
