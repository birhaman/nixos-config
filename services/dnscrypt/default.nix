{ config, pkgs, lib, ... }: {
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
    };
  };

}
