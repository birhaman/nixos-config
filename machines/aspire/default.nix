{ config, pkgs, lib, ... }:
  let
    primaryLocale = "ru_RU.UTF-8";
  in {
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command" "flakes"
      "auto-allocate-uids"

      # "configurable-impure-env"
    ];
    allow-import-from-derivation = true;
    # Forced export of $NIX_PATH
    nix-path = lib.mkForce "$HOME/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels:/nix/var/nix/profiles/per-user/root/channels:nixos-config=$EXT_SYSDIR";
  };

  environment = {
    sessionVariables = rec {
      EXT_SYSDIR = "/wpa/.work.d/system/nixos-config";
    };
  };
 # Visual settings
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  time.timeZone = "Asia/Seoul";
  i18n = {
    defaultLocale = primaryLocale;
    extraLocaleSettings = {
      LANGUAGE = primaryLocale;
      LC_ALL = "en_US.UTF-8";
      LC_TIME = primaryLocale;
      LC_TYPE = primaryLocale;

    };
    supportedLocales = [
      "C.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
      "pt_PT.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system = {
    copySystemConfiguration = true;

    stateVersion = "23.11";
  };

  qt.enable = true;
  qt = {
    platformTheme = "kde";
    style = "breeze";
  };

  fonts = {
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        sansSerif = [];
        monospace = [];
        serif = [];
        # emoji = [];
      };

      antialias = true;
      hinting = {
        style = "slight";
        # autohint = ;
        enable = true;
      };
      # subpixel = {
      #   lcdfilter = ;
      #   rgba = ;
      # };
      allowBitmaps = true;
      useEmbeddedBitmaps = true;
    };

    enableGhostscriptFonts = true;

  };


}
