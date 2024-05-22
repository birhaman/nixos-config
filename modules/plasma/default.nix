{ config, pkgs, lib, home-manager, ... }: {
  # Primary
  environment.plasma6 = {
      excludePackages = with pkgs.libsForQt5; [
        konsole
        oxygen
      ];
  };


  qt.enable = true;
  qt = {
    platformTheme = "kde";
    style = "breeze";
  };

}
