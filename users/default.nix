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
      # hashedPassword = "c553fe2a74ca1eee3ac9684969cf82523df56b89cb02e059a8eac81ae5e15693";
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgn3R6ycFi5zl/fVZDK/LtzY48IriP0aJ9UlZSp2Rlj attachments.bazaar@erine.email"
      ];
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
      # Window managers
      xmonad-with-packages xmobar trayer
      bspwm awesome
      sxhkd libnotify conky
      greetd.greetd
      imagemagick
      font-awesome



      cups system-config-printer hplip xsane
      qpdf poppler_utils
      claws-mail

      # Media
      celluloid tenacity flowblade
      mpv
      mpvScripts.mpvacious
      mkvtoolnix-cli
      gmic gmic-qt

      blender inkscape krita
      prusa-slicer
      fontforge-gtk
      wlroots wlrctl
      wayshot waybar wmenu yofi
      dmenu-wayland rofi-wayland

      nomacs
      wxhexeditor hexd

      vivaldi vivaldi-ffmpeg-codecs
      tor-browser

      qutebrowser luakit nyxt

      timeshift

      libreoffice
      foliate mcomix kate
      qalculate-qt
      colorpicker
      copyq

      obs-studio
      webcamoid droidcam v4l-utils
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

      appimage-run appimagekit

      keepmenu kpcli keepassxc
      veracrypt

      anki-bin
      breeze-icons
      adwaita-qt

      # Messengers
      gajim
      weechat
      weechatScripts.weechat-matrix

      nheko
      telegram-desktop
      simplex-chat-desktop
      element-desktop

      # AI
      ollama


      # Emulators
      rpcs3 pcsx2 pcsxr ppsspp-sdl
      mednafen mednaffe mupen64plus
      ryujinx # replace to suyu
      xemu

      lutris protontricks protonup-qt
      # Proprietary adware shit. Remove as possible.
      heroic legendary-gl
      steam steamPackages.steam-runtime steamcmd steam-run
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
