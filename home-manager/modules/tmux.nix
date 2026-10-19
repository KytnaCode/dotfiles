{apps, ...}: {
  pkgs,
  config,
  lib,
  ...
}: {
  options.custom.programs.tmux.enable = lib.mkEnableOption "enable tmux configuration";

  config = lib.mkIf config.custom.programs.tmux.enable {
    home.packages = with pkgs; [
      tmux
      gitmux

      # Required by tmux easy motion.
      python3

      # Required by muxile.
      websocat
      jq
      qrencode
    ];

    xdg.configFile."tmux".source = apps.tmux;

    home.file.".tmux/plugins/tpm".source = let
      tpm = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tpm";
        rev = "e261deb1b47614eed3400089ce7197dc68acc4eb";
        sha256 = "sha256-oRKUZNyJYQXlkeQfbEYiltUEBpvdwn2SoEBWHVUNmrA=";
      };
    in "${tpm}/";
  };
}
