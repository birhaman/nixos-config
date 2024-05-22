{ config, pkgs, lib, ... }: {

  hardware.sane = {
    extraBackends = with pkgs; [ hplipWithPlugin ];
    enable = true;
  };
  services = {
    printing = {
      enable = true;
      # webInterface = "";
      logLevel = "info";
      drivers = with pkgs; [ hplip cnijfilter2 ];
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
    };

  };

}
