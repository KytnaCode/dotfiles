{apps, ...}: {
  pkgs,
  lib,
  config,
  ...
}: {
  options.custom.programs.kitty.enable = lib.mkEnableOption "enable kitty terminal emulator";

  config = lib.mkIf config.custom.programs.kitty.enable {
    home.packages = with pkgs; [
      kitty
      nerd-fonts.jetbrains-mono
    ];

    home.file.".config/kitty".source = apps.kitty;
  };
}
