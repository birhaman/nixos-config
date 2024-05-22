{ config, pkgs, lib, ... }: {

  services.openssh = {
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = true;
    };
    openFirewall = true;
    ports = [ 443 ];
    enable = true;
  };

  # services.ssh-agent = {
  #   enable = true;
  # };
  programs.ssh = {
    extraConfig = ''
    Host github.com
        HostName github.com
        Port 443
        User git
           IdentityFile /home/dvm0/.ssh/id_ed25519
        ForwardAgent yes
        PreferredAuthentications publickey
        PermitLocalCommand yes
    '';
  };
}
