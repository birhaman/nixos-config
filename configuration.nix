{ config, pkgs, lib, modulesPath, inputs, ... }: {
  imports =
    [ # Include the results of the hardware scan.
          ./machines/aspire/hardware.nix
          ./machines/aspire/default.nix

          ./machines/aspire/networking/default.nix
          # ./services/proxy/cntlm.nix
          # ./services/proxy/proxychains.nix
          # ./services/wireguard.nix

          ./nix/pkgs/nixpkgs.nix
          # ./nix/pkgs/overrides.nix
          # ./nix/overlays/.

          # Whole system
          ./home/modules/main.nix
          ./machines/aspire/instance.nix
          ./modules/plasma/default.nix
          ./services/xserver/default.nix
          ./services/wayland/default.nix
          ./services/systemd/sessions.nix

          ./services/files/transfer.nix
          # ./services/files/ipfs.nix
          ./modules/virtual/default.nix

          ./modules/git/default.nix
          # ./machines/aspire/device-rules.nix

          ./users/default.nix
          ./home/modules/term.nix
          ./home/profiles/primary.nix
          ./modules/secrets/manage.nix

          ./modules/input/default.nix

          ./services/openssh/default.nix
          ./services/powermanage/default.nix
          ./services/sound/default.nix
          ./services/printing/default.nix
          ./services/bluetooth/default.nix
          ./modules/graphics/nvidia.nix

          ./nix/pkgs/texlive.nix
          ./modules/nixvim/module.nix

          # ./modules/input/fcitx.nix
          # Home-manager

          # Hydra builds
          # ./contrib/hydra.nix


          # ./services/custom/default.nix
          # ./services/custom/inprod.nix


    ];}
