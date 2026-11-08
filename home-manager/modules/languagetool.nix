{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
in {
  options.custom.services.language-tool.enable = mkEnableOption "enable self hosted language tool server";

  config = mkIf config.custom.services.language-tool.enable {
    systemd.user.services.language-tool = {
      Unit = {
        Description = "self-hosted LanguageTool server";
        After = ["network.target"];
        Wants = ["network.target"];
      };

      Service = {
        ExecStart = "${pkgs.languagetool}/bin/languagetool-http-server";
      };

      Install = {
        WantedBy = ["multi-user.target"];
      };
    };
  };
}
