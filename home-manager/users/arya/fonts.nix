{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;
      antialiasing = true;

      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font" "FiraCode Nerd Font"];
        sansSerif = ["Quicksand" "M PLUS 1" "Montserrat" "Raleway" "Roboto"];
        serif = ["Aleo" "TakaoMincho" "Merriweather" "Noto Serif"];
        emoji = ["Noto Color Emoji" "Noto Emoji"];
      };
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    quicksand
    montserrat
    raleway
    roboto
    aleo-fonts
    merriweather
    noto-fonts
    noto-fonts-color-emoji
    takao
    mplus-outline-fonts.githubRelease
  ];
}
