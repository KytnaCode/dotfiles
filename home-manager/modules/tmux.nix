{apps, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  options.custom.programs.tmux.enable = lib.mkEnableOption "enable tmux";

  config = lib.mkIf config.custom.programs.tmux.enable {
    home.packages = [pkgs.tmux];

    xdg.configFile = {
      "tmux/tmux.conf".source = apps.tmux + "/tmux.conf";
      "tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "e261deb1b47614eed3400089ce7197dc68acc4eb";
        hash = "sha256-oRKUZNyJYQXlkeQfbEYiltUEBpvdwn2SoEBWHVUNmrA=";
      };
    };
  };
}
