{ config, lib, pkgs, ... }:
{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
       driSupport32Bit = true;
    # extraPackages = {};
    };

    nvidia = {
       modesetting.enable = true;
       nvidiaSettings = true;
       powerManagement.enable = false;
       powerManagement.finegrained = false;
       open = false;
       package = config.boot.kernelPackages.nvidiaPackages.production;

       prime = {
         amdgpuBusId = "PCI:5:0:0";
         nvidiaBusId = "PCI:1:0:0";
         offload = {
            enable = true;
            enableOffloadCmd = true;
         };
       };

    };

  };

}
