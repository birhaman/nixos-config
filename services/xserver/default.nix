{ config, pkgs, lib, ... }: {
  services.xserver = {
    windowManager = {
      awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql # dB abstraction layer
        ];
      };
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
    desktopManager = {
      plasma5.enable = true;
    };

    # Excluded packages
    excludePackages = [

    ];
    videoDrivers = [ "nvidia" "amdgpu" ];

    enable = true;
    autorun = false;
  };

  services.displayManager = {
    sddm = {
      # defaultSession = {};
      # setupScript = {};
      # autoNumlock = {};
      # autoLogin = {};

      wayland.enable = true;
      # theme = {};
      enable = true;
    };
    defaultSession = "plasma";
    # 'plasma'/'none+*wm'
  };

  # Package sets
  environment.systemPackages = with pkgs.xorg; [
    xorgserver

    xf86inputevdev
    xf86inputsynaptics
    xf86videoati
    xf86videointel

    xkbcomp xkbutils xinput
    xkbprint xkbevd xev
    setxkbmap
    xmodmap

    xlsfonts encodings xdpyinfo xlsatoms
    xvinfo xcursorgen
    fontutil

    xset xsetroot xsm xtrap
    xdriinfo xeyes
    xpr xprop
    xrdb
    xinit
    xauth
    xfs xfsinfo
    xmessage
    xbacklight
    xkill

    libxcb xcbproto
    xcbutil
    xcbutilkeysyms
    xcbutilcursor
    xcbutilerrors
    xcbutilrenderutil
    xcbutilwm

    libXrandr libXrender
    libXpresent libXcomposite libXinerama
    libICE libSM iceauth imake
    libX11
    libXau libXpm libXmu libXaw libXi libXtst
  ];

}
