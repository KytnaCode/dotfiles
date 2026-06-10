# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  lib,
  dotfiles-hm,
  custom,
  ...
}: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./programs.nix
    ]
    ++ (with custom; [
      i18n
      sound
      bluetooth
      fonts
      networking
    ]);

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.arya = dotfiles-hm.homeManagerModules.arya;
  };

  custom = {
    i18n.enable = true;
    hardware = {
      bluetooth.enable = true;
      sound.enable = true;
    };
    fonts.enable = true;
    networking.enable = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "arya-pc"; # Define your hostname.

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "lunacy"
      "obsidian"
    ];

  # Set your time zone.
  time.timeZone = "America/Mazatlan";

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  users.users.arya = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      vim
    ];
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
