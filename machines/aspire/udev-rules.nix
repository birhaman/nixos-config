{ config, pkgs, lib, modulesPath, ... }: {
  services.udev = {
    # Added into 99-local.rules, loaded after others.
    extraRules = ''
      SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="1b8e", ATTR{idProduct}=="c003", MODE:="0666", SYMLINK+="worldcup"
    '';
    packages = [
    ];
    path = [  ];
  };
}
