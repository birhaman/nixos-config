{ config, pkgs, lib, ... }: {

  packageOverrides = super: let self = super.pkgs; in {
   profiledHaskellPackages = self.haskellPackages.override {
     overrides = self: super {
       mkDerivation = args: super.mkDerivation (args // {
         enableLibraryProfilign = true;
       });
     };

   };


  };
}
