{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption optionals;
in {
  options.custom.input = {
    enable = mkEnableOption "enable input module";

    fcitx5 = {
      enable = mkEnableOption "enable fcitx5";
      japaneseKeyboard = mkEnableOption "enable mozc japanese keyboard";
    };

    ibus = {
      enable = mkEnableOption "enable ibus";
      japaneseKeyboard = mkEnableOption "enable mozc japanese keyboard";
    };
  };

  config = let
    cfg = config.custom.input;
  in
    mkIf cfg.enable {
      i18n.inputMethod = {
        enable = cfg.fcitx5.enable || cfg.ibus.enable;
        type =
          if cfg.fcitx5.enable
          then "fcitx5"
          else if cfg.ibus.enable
          then "ibus"
          else "";

        fcitx5.addons = mkIf cfg.fcitx5.enable (with pkgs;
          [
            fcitx5-gtk
          ]
          ++ optionals cfg.fcitx5.japaneseKeyboard [fcitx5-mozc]);

        ibus.engines =
          mkIf cfg.ibus.enable (with pkgs.ibus-engines;
              optionals cfg.ibus.japaneseKeyboard [mozc]);
      };

      # environment.variables = {
      #   GTK_IM_MODULE = "ibus";
      #   QT_IM_MODULE = "ibus";
      #   XMODIFIERS = "@im=ibus";
      # };
    };
}
