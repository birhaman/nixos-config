{ config, pkgs, lib, home-manager, ... }:
  with lib; let
   home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  in
{ imports = [
    (import "${home-manager}/nixos")
  ];
  # Programs declared

  programs.direnv = {
    nix-direnv.enable = true;
    enable = true;
  };

  # Steam
  programs.steam = {
    # Firewall ports opening for Steam Remote Play, Source Dedicated Server
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;

    enable = true;
  };
}
