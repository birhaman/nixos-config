{ config, pkgs, lib }: {

  services.tor = {
    settings = {
      UseBridges = true;
      ClientTransparentPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
      Bridge = "obfs4 IP:ORPort [fingerprint]";
    };
    client = {
      dns.enable = true;
      enable = true;
    };
  };

}
