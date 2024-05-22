with import <nixpkgs> {};
  mkShell {
      NIX_LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [

      ];

      NIX_LD = lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
      QT_PLUGIN_PATH = "${qt5.qtbase}/${qt5.qtbase.qtPluginPrefix}:${qt5.qtwayland.bin}/${qt5.qtbase.qtPluginPrefix}";
      QML2_IMPORT_PATH = "${qt5.qtdeclarative.bin}/${qt5.qtbase.qtQmlPrefix}:${qt5.qtwayland.bin}/${qt5.qtbase.qtQmlPrefix}";
  }
