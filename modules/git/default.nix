{ config, pkgs, lib, home-manager, ... }: {
  programs.git = {
    enable = true;
    # extraConfig = {
    #   credential.helper = "${
    #     pkgs.git.override { withLibsecret = true; }
    #   }/bin/git-credential-libsecret";
    # };
  };

  users.users.git = {
    isSystemUser = true;
    group = "git";
    home = "/var/lib/git-server";
    createHome = true;
    # shell = "$(pkgs.git)/bin/git-shell";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgn3R6ycFi5zl/fVZDK/LtzY48IriP0aJ9UlZSp2Rlj attachments.bazaar@erine.email"
    ];
  };
  users.groups.git = {};




}
