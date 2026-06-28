{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption optionals;
in {
  options.custom.input = {
    fcitx5 = {
      enable = mkEnableOption "enable fcitx5";
      japaneseKeyboard = mkEnableOption "enable mozc japanese keyboard";
    };
  };

  config = let
    cfg = config.custom.input.fcitx5;
  in
    mkIf cfg.enable {
      i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = with pkgs;
          [
            fcitx5-gtk
          ]
          ++ optionals cfg.japaneseKeyboard [fcitx5-mozc];
      };

      home.sessionVariables = {
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        GLFW_IM_MODULE = "ibus";
        INPUT_METHOD = "fcitx";
      };
    };
}
