{ config, lib, pkgs, modulesPath, ... }: {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Bootloader
  boot.loader = {
     grub.enable = true;
     grub.efiSupport = true;
     efi.canTouchEfiVariables = true;
     efi.efiSysMountPoint = "/boot";
     grub.device = "nodev";
  };
  boot.zfs = {
    forceImportRoot = false;
  };

  # Kernel declared
  boot = {
     kernelModules = [
       "kvm-amd" "bridge" "atkbd"
       "macvlan" "tap" "tun" "loop" "ctr"
       "fuse" "coretemp"

       "acpi-cpufreq" "cpufreq-ondemand"
       "nvidia" "nvidia_modeset" "nvidia_drm"
       # Input
       "uinput"
       # Videocamera
       "v4l2loopback"
       # "snd-aloop"
     ];
     blacklistedKernelModules = [

     ];

     kernelParams = [
       "acpi=on" "console=tty1"
     ];

     # Initrd params
     initrd = {
       availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
       kernelModules = [ "dm_mod" ];
     };

     extraModulePackages = with config.boot.kernelPackages; [
       v4l2loopback
     ];

     extraModprobeConfig = ''
       options snd_hda_intel enable=0,1
     '';

     supportedFilesystems = [ "zfs" "ext4" "vfat" "xfs" "ufs" "ntfs"];
  };

  # Disk partitioning
  fileSystems = {
    "/" =
      { device = "/dev/disk/by-label/nixos";
        fsType = "ext4";
        options = [ "rw" "defaults" "relatime" ];
      };
    "/boot" =
      { device = "/dev/disk/by-label/boot";
        fsType = "vfat";
        options = [ "rw" "defaults" "relatime" ];
      };

    "/home" =
      { device = "/dev/disk/by-label/home";
        fsType = "ext4";
        options = [ "rw" "defaults" "relatime" ];
      };
    "/wpa" =
      { device = "/dev/disk/by-label/wpa";
        fsType = "ext4";
        options = [ "rw" "relatime" ];
      };
  };

  swapDevices = [ ];

  # Platform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
