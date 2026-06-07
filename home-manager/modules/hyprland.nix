{
  apps,
  inputs,
  ...
}: {
  lib,
  config,
  pkgs,
  ...
}: {
  options.custom.programs.hyprland.enable = lib.mkEnableOption "enable hyprland";

  config = lib.mkIf config.custom.programs.hyprland.enable {
    xdg.configFile."hypr".source = apps.hyprland;

    home.packages = with pkgs; [
      swaynotificationcenter
      mpvpaper
      inputs.hyprquickshot.packages.${pkgs.stdenv.hostPlatform.system}.default
      vicinae
    ];

    xdg.configFile."systemd/user/vicinae.service" = {
      source = "${pkgs.vicinae}/share/systemd/user/vicinae.service";
    };

    home.activation.enableVicinae = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if ! ${pkgs.systemd}/bin/systemctl --user --quiet is-active vicinae.service; then
        ${pkgs.systemd}/bin/systemctl --user enable --now vicinae.service
      fi
    '';
  };
}
