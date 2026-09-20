# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  lib,
  pkgs,
  dotfiles-hm,
  custom,
  ...
}: {
  imports =
    [
      ./programs.nix
      ./hardware-configuration.nix
    ]
    ++ (with custom; [
      bluetooth
      fonts
      i18n
      input
      kernel
      networking
      sound
    ]);

  environment.pathsToLink = ["/share/xdg-desktop-portal" "/share/applications"];

  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;

    users = {
      arya = dotfiles-hm.homeManagerModules.arya;
      sasa = dotfiles-hm.homeManagerModules.sasa;
    };
  };

  services.logind.settings.Login.HandleLidSwitch = "ignore";

  custom = {
    i18n.enable = true;
    input = {
      enable = true;

      fcitx5 = {
        enable = false;
        japaneseKeyboard = true;
      };

      ibus = {
        enable = true;
        japaneseKeyboard = true;
      };
    };
    hardware = {
      bluetooth.enable = true;
      sound.enable = true;
    };
    fonts.enable = true;
    networking = {
      enable = true;
      enableWireless = true;
    };
    kernel.hardening.enable = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam-unwrapped"
      "steam"
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "LesbaMovil"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Mazatlan";

  services = {
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
      plasma6.enable = true;
    };

    fprintd.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  users.users = {
    arya = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
      packages = with pkgs; [
        vim
      ];
    };

    sasa = {
      isNormalUser = true;
      shell = pkgs.zsh;
    };
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
