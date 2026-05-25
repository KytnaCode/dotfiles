{
  lib,
  config,
  ...
}: {
  options.custom.i18n.enable = lib.mkEnableOption "enable default i18n options";

  config = lib.mkIf config.custom.i18n.enable {
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocales = ["es_MX.UTF-8/UTF-8"];
    };
  };
}
