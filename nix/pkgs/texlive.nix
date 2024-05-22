{ config, pkgs, ... }: let

  texlive-main = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
      dvisvgm dvipng  # for preview and export as html
      wrapfig amsmath ulem hyperref capt-of;
      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  });

in { # home-manager
  home-manager.users.dvm0.home = {
    packages = with pkgs; [
      texlive-main
    ];
  };
}
