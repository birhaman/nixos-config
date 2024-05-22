{ config, pkgs, lib, ... }: {

  services.cntlm = {
    proxy = [ "103.163.53.91:64693" ];
    domain = "aspire";
    username = "DXf2sxr5";
    password = "2EVysff7";
  };
  services.cntlm.enable = true;

  users = {
    users.cntlm.group = "cntlm";
    groups.cntlm = { };
  };

}
