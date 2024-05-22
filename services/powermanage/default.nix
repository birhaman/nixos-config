{ config, lib, pkgs, ... }: {

  powerManagement = {
    enable = true;
  };
  services.upower = {
    enable = true;
  };

#  hardware.fancontrol = {

  # At time should be enabled either tlp or cpufreq.
#  };
#    services.tlp = {
#      enable = true;
#      settings = {

#      };
#    };

  # services.auto-cpufreq = {
  #   settings = {
  #     battery = {
  #       governor = "powersave";
  #       turbo = "never";
  #     };
  #     charger = {
  #       governor = "performance";
  #       turbo = "auto";
  #     };
  #   };
  # };


}
