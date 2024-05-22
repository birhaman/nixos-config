{ config, pkgs, lib, ... }: {
  virtualisation = {
    # efi = {};
    docker = {
      enable = true;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      # daemon.settings = {

      # };
      # enableNvidia = true;
    };

    oci-containers = {

    };
    podman.enable = true;

    # qemu = {
    #   options = {};
    #   drives = {};

    # Android
    waydroid.enable = true;


    };


}
