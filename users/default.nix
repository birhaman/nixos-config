{ config, pkgs, lib, home-manager, ... }: {
 # Defining user accounts, profiles and properties.
  users = {
    # extraGroups = [  ];
    defaultUserShell = pkgs.zsh;
    users.dvm0 = {
      home = "/home/dvm0";
      extraGroups = [
        "wheel" "audio" "video" "plugdev" "input" "networkmanager" "docker" "adbusers" "scanner" "lp"
      ];
      hashedPassword = "$y$j9T$4GUrcjM44bcpGFbP8UzyP/$NlZ26azF0ekWBxNVaAxXBzE63i52/ZkumDAcj0DLSh/";
      openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgn3R6ycFi5zl/fVZDK/LtzY48IriP0aJ9UlZSp2Rlj attachments.bazaar@erine.email"
      ];
      shell = pkgs.zsh;
      isNormalUser = true;
      createHome = true;
      # description = "";
      uid = 1000;
    };


    # External user
  #   users.root = {
  #     isNormalUser = true;
  #     # openssh.authorizedKeys.keyFiles = [ ];
  #   };
  };

  nix.settings = {
    allowed-users = [ "@wheel" "dvm0" ];
    trusted-users = [ "@wheel" "dvm0" "root" ];
  };

 # Security & Auth
  security = {
    doas.extraRules = [{
      groups = [ "wheel" ];
      persist = true;
      keepEnv = true;
    }];
    doas.enable = true;

    sudo.enable = true;
  };

  programs.zsh.enable = true;

  home-manager.users.dvm0 = {
    home.stateVersion = "24.05";
    # 2024-01-10 cause DDoS
    manual.manpages.enable = false;

    home.packages = with pkgs; [
      xmonad-with-packages xmobar trayer
      bspwm awesome

      sxhkd libnotify greetd.greetd
      conky

      font-awesome

      cups system-config-printer hplip xsane
      qpdf poppler_utils

      # Media
      celluloid tenacity flowblade
      mpv
      mpvScripts.mpvacious
      mkvtoolnix-cli
      gmic gmic-qt

      blender inkscape krita
      prusa-slicer
      fontforge-gtk

      # Wayland
      wlroots wlrctl
      wayshot waybar wmenu yofi
      dmenu-wayland rofi-wayland
      anki-bin
      breeze-icons
      adwaita-qt

      nomacs
      wxhexeditor hexd


      # Games
      opendungeons
      cataclysm-dda
      dwarf-fortress

      lutris protontricks protonup-qt
      heroic legendary-gl
      steam steamPackages.steam-runtime steamcmd steam-run


      vivaldi vivaldi-ffmpeg-codecs
      qutebrowser luakit nyxt

      timeshift

      libreoffice
      foliate mcomix kate
      qalculate-qt
      colorpicker
      copyq

      obs-studio
      droidcam v4l-utils webcamoid
      aegisub

      emacs29-gtk3 cask
      neovim-gtk neovide neovim neovim-remote vim-full

      lazygit
      ghq gst

      # Cryptocurrency
      electrum feather monero zecwallet-lite
      qbittorrent
      yt-dlp

      # Tezos
      ligo tezos-rust-libs

      keepmenu kpcli keepassxc
      veracrypt

      appimage-run appimagekit


      # Messengers
      gajim

      nheko
      telegram-desktop
      simplex-chat-desktop
      element-desktop

      ollama

      # Emulators
      rpcs3 pcsx2 pcsxr ppsspp-sdl
      mednafen mednaffe mupen64plus
      ryujinx # suyu replaced
      xemu
       # Proprietary adware shit. Remove as possible.
      webcord
      zoom-us

      chirp

    ];
  };

  environment.sessionVariables = rec {
    WXSUPPRESS_SIZER_FLAGS_CHECK = "1";
    ANKI_WAYLAND="1";
  };


}
