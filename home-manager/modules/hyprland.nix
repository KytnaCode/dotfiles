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
    home.packages = with pkgs; [
      swaynotificationcenter
      mpvpaper
      inputs.hyprquickshot.packages.${pkgs.stdenv.hostPlatform.system}.default
      vicinae
    ];

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
      ];
    };

    xdg.configFile = {
      "hypr".source = apps.hyprland;

      "xdg-desktop-portal/hyprland-portals.conf".source = apps.xdg-desktop-portal.hyprland;

      "systemd/user/vicinae.service".source = "${pkgs.vicinae}/share/systemd/user/vicinae.service";
    };

    home.activation.enableVicinae = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if ! ${pkgs.systemd}/bin/systemctl --user --quiet is-active vicinae.service; then
        ${pkgs.systemd}/bin/systemctl --user enable --now vicinae.service
      fi
    '';
  };
}
