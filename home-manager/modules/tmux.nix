{apps, ...}: {
  pkgs,
  config,
  lib,
  ...
}: {
  options.custom.programs.tmux.enable = lib.mkEnableOption "enable tmux configuration";

  config = lib.mkIf config.custom.programs.tmux.enable {
    home.packages = [
      pkgs.tmux
    ];

    xdg.configFile."tmux".source = apps.tmux;
  };
}
