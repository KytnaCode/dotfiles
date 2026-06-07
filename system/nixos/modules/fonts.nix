{
  config,
  lib,
  pkgs,
  ...
}: {
  options.custom.fonts.enable = lib.mkEnableOption "enable default fonts";

  config = lib.mkIf config.custom.fonts.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      mplus-outline-fonts.githubRelease
      liberation_ttf
      liberation-sans-narrow
    ];
  };
}
