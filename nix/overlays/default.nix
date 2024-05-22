{ config, pkgs, lib }: {
  nixpkgs.overlays = [
    self.inputs.nix-alien.overlays.default
  ];
}
