{ config, pkgs, lib, ... }: {
  # imports = [
  #   <nix-ld/modules/nix-ld.nix>
  # ];

  nix.settings = {
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      ];
  };

  # programs.nix-ld.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;

    allowBroken = true;
    allowlistedLicences = true;
    # Nix User Repository package fetcher
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
  #     sha256 = "4acdae875221d99d3f75cf47b4bf2724f26e56a45162bf0eae8ae2763b7b232e";
  #   }))
  # ];

  # nix.package = pkgs.nixUnstable;

  #nixpkgs.binaryCaches = [ https://cache.nixos.org https://hydra.nixos.org ];
}
