{apps, ...}: {
  lib,
  config,
  pkgs,
  ...
}: {
  options.custom.programs.ssh = {
    enable = lib.mkEnableOption "enable ssh configuration";
    ssh-agent.enable = lib.mkEnableOption "enable ssh-agent";
    sshfs.enable = lib.mkEnableOption "enable sshfs";
  };

  config = let
    conf = config.custom.programs.ssh;
  in
    lib.mkIf conf.enable {
      home.packages =
        [
          pkgs.openssh
        ]
        ++ (lib.optional conf.sshfs.enable pkgs.sshfs);

      services.ssh-agent.enable = lib.mkIf conf.ssh-agent.enable true;

      home.file.".ssh/config".source = apps.ssh;
    };
}
