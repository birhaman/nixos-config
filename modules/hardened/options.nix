{ config, pkgs, lib }: {
  programs.firejail = {
    wrappedBinaries = {
      # vivaldi = {
      #   executable = "$";
      #   profile = "$";
      # };
    };
    enable = true;
  };
}
