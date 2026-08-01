{apps, ...}: {
  lib,
  config,
  pkgs,
  ...
}: {
  options.custom.programs.bat.enable = lib.mkEnableOption "enable bat configuration";

  config = lib.mkIf config.custom.programs.bat.enable {
    home.packages = with pkgs; [
      bat
    ];

    xdg.configFile."bat" = {
      source = apps.bat;
      recursive = true;
    };

    xdg.configFile."bat/themes/yume.tmTheme".source = let
      yume-theme = pkgs.fetchFromGitHub {
        owner = "kytnacode";
        repo = "bat-yume";
        rev = "a508d7f402cac27ddfb8283db419673c8718b089";
        sha256 = "sha256-gMtwQ4xo1i1e10p2JzRk9U2RnTDZeVvoDGryUjnFzuM=";
      };
    in "${yume-theme}/themes/yume.tmTheme";
  };
}
