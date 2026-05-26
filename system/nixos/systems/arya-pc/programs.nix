{pkgs, ...}: {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    zsh.enable = true;
  };

  environment = {
    pathsToLink = ["/share/zsh"];
    
    sessionVariables.NIXOS_OZONE_WL = "1";
    
    systemPackages = with pkgs; [
      # Some utilities I always thank to be present when doing system tasks.
      vim
      wget
      curl
      netcat-gnu
      jq
    ];
  };
}
