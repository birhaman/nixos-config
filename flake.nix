{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flakeforge = {
      url = "github:elohmeier/flakeforge";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-alien.url = "github:thiagokokada/nix-alien";

    lollypops.url = "github:pinpox/lollypops";
    # flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # emacs-overlay.url = {
    #   url = "github:nix-community/emacs-overlay";
    #   inputs.nixkpgs.follows = "nixpkgs";
    # };

    rust-overlay.url = "github:oxalica/rust-overlay";
    naersk = {
      url = "github:nix-community/naersk/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # xmonad-contexts.url = "github:Procrat/xmonad-contexts";
    sops-nix.url = "github:Mic92/sops-nix";

  };

  # nixConfig = {
  #   extra-trusted-public-keys = "";
  #   extra-substituers = "";
  # };

  outputs = inputs@{ self,
      nixpkgs, nix, flake-utils, flake-parts, flakeforge, home-manager, nur,
      nix-alien, nix-ld, ... }:
     let
  	  # overlays = [ (import rust-overlay) ];
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
     inherit (nixpkgs) lib;
  	 rustVersion = pkgs.rust-bin.stable.latest.default;
     # Expose overlay to flake outputs, to allow using it from other flakes.
     # Flake inputs are passed to the overlay so that the packages defined in it can use the sources pinned in flake.lock
     # overlays.default = final: prev: (import ./nix/overlays inputs) final prev;
     in {
      nixosConfigurations.aspire = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit self; };
        # extraSpecialArgs = { inherit inputs;};
        modules = [
          { nixpkgs.overlays = [ nur.overlay ]; }
          ({ pkgs, ... }: let
            nur-no-pkgs = import nur {
              nurpkgs = import nixpkgs { inherit system; };
            }; in {
              imports = with nur-no-pkgs; [ repos.iopq.modules.xraya ];
              services.xraya.enable = false;
            })
          ./configuration.nix
        ];
      };

      nixosModules = builtins.listToAttrs (map
        (x: {
          name = x;
          value = import (./modules + "/${x}");
        })
        (builtins.attrNames (builtins.readDir ./modules)));

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      devShells.pkgs.mkShell = {
        name = "pydev";
        packages = [
          (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
            pandas requests scipy statsmodels filebytes pyvex
          ]))];
        # buildInputs = [
        # ];
      };


     };
}
