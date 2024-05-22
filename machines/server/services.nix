{ config, pkgs, lib, ... }:
{
  services = {
    # openssh = {
    #   enable = true;
    #   settings = {
    #     PasswordAuthentication = false;
    #     PermitRootLogin = "no";
    #   };
    # };

    mosquitto = {

    };

    postgresql = {
      enable = true;
      ensureDatabases = [ "" "" ];
      authentication = pkgs.lib.mkOverride 10 ''
      '';
    };

    # nginx = {
    #   recommendedTlsSettings = true;
    #   recommendedOptimisation = true;
    #   recommendedGzipSettings = true;
    # }

  };
}
