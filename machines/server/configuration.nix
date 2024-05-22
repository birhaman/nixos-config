# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, lib, modulesPath, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./machines/server/hardware.nix
      ./machines/server/networking.nix
#     ./services/wireguard.nix

      ./nix/pkgs/nixpkgs.nix
      ./options/virtual-main.nix
#     ./nix/overlays/.

      ./machines/server/default.nix
      ./machines/server/instance.nix

      ./users/default.nix
#     ./machines/server/udev-rules.nix
      ./modules/input/default.nix
#     ./services/custom/default.nix

      # Home-manager specs
      
    ];

  # Select internationalisation properties.
  nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  #  useXkbConfig = true; # use xkb.options in tty.
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "pt_PT.UTF-8/UTF-8"
  ];
  time.timeZone = "Europe/Samara";


  # Nix common
   #   allowed-users = [ "root" "@wheel" "@builders" ];
   #   trusted-users = [ "root" "@wheel" "@builders" ];


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.

  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.

  system.stateVersion = "23.11";

}

