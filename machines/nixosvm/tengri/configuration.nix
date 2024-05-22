{ config, pkgs, ... }: {

  imports = [
    ./networking.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.initrd = {
    availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
    kernelModules = [ "dm_mod" ];
  };

  boot = {
    # kernelModules = {

    # };
    # kernelParams = {

    # };
    extraModulePackages = [];
    extraModprobeConfig = ''
      options snd_hda_intel enable=0,1 '';
    # blacklistedKernelModules = [ ];
    supportedFilesystems = [ "zfs" "ext4" "vfat" "xfs" "ufs" "ntfs"];
    zfs.forceImportRoot = false;
    # zfs.extraPools
  };


  users.users.virt-dv0 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      cowsay
      lolcat
    ];
    initialPassword = "LzuMia==";
  };

  system.stateVersion = "23.11";
}
