{apps, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  options.custom.programs.git.enable = lib.mkEnableOption "enable dotfile's git config";

  config = lib.mkIf config.custom.programs.git.enable {
    home.packages = with pkgs; [
      git
      git-credential-oauth
    ];

    home.file.".gitconfig".source = apps.git.config;
  };
}
