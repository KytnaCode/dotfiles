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
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
      ];

      config.common = {
        default = "hyprland,gnome";
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
    };

    xdg.configFile = {
      "hypr".source = apps.hyprland;

      "xdg-desktop-portal-termfilechooser/config".text = ''
        [filechooser]
        cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
        default_dir=$HOME
        env=TERMCMD='kitty --title "File Chooser"'
        env=PATH="$PATH:/run/current-system/sw/bin"
        open_mode = suggested
        save_mode = last
      '';

      "systemd/user/vicinae.service".source = "${pkgs.vicinae}/share/systemd/user/vicinae.service";
    };

    home.activation.enableVicinae = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if ! ${pkgs.systemd}/bin/systemctl --user --quiet is-active vicinae.service; then
        ${pkgs.systemd}/bin/systemctl --user enable --now vicinae.service
      fi
    '';
  };
}
