{pkgs,...}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    # Some utilities I always thank to be present when doing system tasks.
    vim 
    wget
    curl
    netcat-gnu
    jq
  ];
}
