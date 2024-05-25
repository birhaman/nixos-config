{ config, pkgs, lib, home-manager, ... }: let
   # };
     # perlPkgs = pkgs.perl.withPackages ()
     # luaPkgs = pkgs.lua5_3.withPackages (; with p; [ readline ]);
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  # xorgFull = pkgs.xorg
  #   (xorg: with xorg; [
  #     xclock
  #   ]);
  pyPkgs = pkgs.python311.withPackages
     (python-pkgs: with python-pkgs; [
       pip pipx virtualenv numpy scipy statsmodels
       pyqt5 pyqtgraph
       keystone-engine ropper
       pytorch scikit-learn
       adblock
       py-cpuinfo
     ]);
  haskellPkgs = pkgs.haskellPackages.ghcWithPackages
    (haskellPackages: with haskellPackages; [
      hix
      haskell-language-server
      # Libraries
      async cgi
    ]);

   # xorgPkgs = pkgs.xorg.withPackages ()
 in {
   fonts.packages = with pkgs; [
     liberation_ttf
     libertine dejavu_fonts gyre-fonts
     terminus_font ubuntu_font_family vistafonts

     # From Nerdfonts
     (nerdfonts.override { fonts = [
       "JetBrainsMono" "DroidSansMono"
     ]; })
     fira-code fira-code-symbols

     noto-fonts-cjk noto-fonts-emoji
     mplus-outline-fonts.githubRelease

     # Foreign
     kanit-font sarabun-font tlwg

  ];

   environment.systemPackages = with pkgs; [
    # Wayland
    wayland xwayland xdg-utils desktop-file-utils
    polkit polkit-kde-agent
    gsettings-qt gsettings-desktop-schemas
    devour

    wl-clipboard
    wayland-logout
    grim slurp
    svkbd vmpk

    # X Server
    xcape xclip xkb-switch
    cmigemo

    xcbutilxrm xcb-imdkit
    xf86_input_wacom wacomtablet xdotool
    libGL libGLU
    automake autoconf gnumake cmake patch xorg.gccmakedep xorg-autoconf
    qt5.qmake ninja


    binutils efibootmgr
    inetutils wirelesstools ssh-tools openssl wget xinetd
    pciutils usbutils usbtop

    i2c-tools xc3sprog esptool-ck meson-tools
    stlink openocd cvehound hashcat
    acpica-tools

    # Filesystems
    fuse2fs e2fsprogs sysfsutils exfatprogs udftools hfsprogs xfsprogs ntfsprogs apfsprogs
    dwarfs fuse-overlayfs dwarfdump aefs attr acl
    reiserfsprogs reiser4progs
    zfs zfstools zlog

    qt5ct qt5.qtbase qt6.qtbase
    gtkmm3
    dconf dconf2nix
    pkg-config zlib

    # Graphics
    mesa mesa_drivers mesa_glu mesa-demos
    dxvk_2 vulkan-tools vkbasalt vkmark
    vulkan-headers vulkan-extension-layer vulkan-validation-layers
    SDL2 SDL2_gfx SDL2_image SDL2_ttf SDL2_mixer SDL2_net SDL SDL_gfx SDL_sound SDL_image SDL_net
    # Wine
    wineWowPackages.stable
    winetricks bottles mono wineasio
    potrace clipper xca freetype ttfautohint woff2 ghostscript brotli
    libstdcxx5
    xxHash

    # Monitroing
    htop iotop atop iftop strace ltrace ethtool nmon
    btop glances sysstat mtr socklog
    lshw lsscsi inxi lsof tree
    mlocate blktrace nvme-cli

    glibc graphviz ncurses fontconfig gparted
    chafa pandoc urlscan man
    apio chisel sudo doas
    home-manager

    # Sound
    alsa-lib alsa-utils alsa-oss
    pipewire wireplumber pwvucontrol pipecontrol qpwgraph
    jack2 jackmix qjackctl
    ffmpeg
    bluez blueman bluez-tools


    # Nixpkgs
    nix-ld nix-index nix-bundle direnv nix-direnv cachix niv nox dumpnar
    nix-du nix-tree nix-query-tree-viewer manix
    nix-info nix-doc nix-init nix-plugins nix-output-monitor
    nixfmt-classic
    nixel statix nixci nixd nil nurl
    cabal2nix zon2nix yarn2nix elm2nix
    patchelf autoPatchelfHook file

    chrony bc
    findutils libtool which gnused
    udevil libudev-zero libusb libusb-compat-0_1 libftdi1 hidapi
    dcfldd foremost timeshift rsnapshot bacula
    cdrtools cdimgtools dvdplusrwtools libburn
    lsdvd
    libuuid
    rare-regex


    zip unzip gzip xz unrar lrzip atool
    lf links2 fzf iperf3 dnsutils zstd
    rpmextract makerpm


     # C
    clang ccls sdcc
    arrow-cpp
    rtags ctags
    gcc gdb tk
    gcc-arm-embedded
    git


    torrenttools
    xcftools vgmtools

    argc

    # Laptop section
    lm_sensors ddcutil havoc redshift fanctl brillo acpi
    auto-cpufreq

    fprintd
    gnupg pinentry-curses pinentry-emacs
    age

    # Network analysis
    cntlm tun2socks proxychains
    xray v2raya tor tensor
    nginx caddy

    aria2 curl ain ipget socat peco nmap ipcalc rs
    ack ripgrep
    curlie
    kubo

    wireshark tcpdump hcxdumptool
    rtmpdump dhcpdump ssldump httpdump
    mitmproxy proxychains
    ratman

    # Серверная часть
    docker docker-compose arion dive
    kubernetes kubectl
    firecracker firectl
    syncthing

    sqlite sqlite-utils sqlite-jdbc
    dbeaver
    postgresql pgtop pg_activity
    redis webdis

    apacheKafka kafkactl kcat rdkafka topicctl td
    grafana

   ];




 home-manager.users.dvm0 = {
   home.packages = with pkgs; [
     pyPkgs
     haskellPkgs stack
     # Package sets defined above.

     micromamba
     # perlPkgs scalaPkgs luaPkgs
     # luaPkgs

     # Java
     zulu21

     # Solidity
     solc

     # Perl
     perl
     perlPackages.HTMLParser perlPackages.XMLParser perlPackages.RegexpParser
     # Ruby
     ruby rubyPackages.solargraph
     jekyll

     # Guile
     guile
     guile-config guile-sjson


     # R
     R

     # Lua
     luarocks
     # Rust
     rustc rust-analyzer rustfmt
     cargo cargo-binutils
     selene
     wasmer

     travis

     # Scala
     scala_3 ammonite coursier scalafmt scalafix
     sbt-extras
     gradle
     grpc-tools

     # Reverse engineering
     radare2 ghidra
     capstone
     hopper binwalk


     # Dart & Golang
     flutter
     go
     astyle
     # Android
     android-tools apksigner apktool aapt
     waydroid

     # Clojure
     clojure cljfmt clojure-lsp joker
     # Lisp
     sbcl clisp
     scsh
     # Zig
     zig zls

     # Nim
     nim nimlsp
     # Fortran


     # Scripting
     nodejs
     typescript
     deno
     elmPackages.elm
     skim

     # Shaders
     glslang glslls glslviewer esshader
     plantuml

     # Markup
     jansson jsoncpp libjson yyjson
     rapidjson simdjson
     xml2 libyaml
     jless jfmt jsawk jid jq jtc jet
     yj rapidyaml yamale
     toml2nix
     exiftool

     # FPGA
     ghdl-llvm vhdl-ls yosys yosys-ghdl
     verible verilator vhd2vl

   ];
 };

}
