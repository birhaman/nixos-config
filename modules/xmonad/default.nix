{ xmonad-contents, config, pkgs, lib, ... }: {
...
  services.xserver.windowManager.xmonad = {
    ...
    ghcArgs = [
      "-hidir /tmp" # place interface files in /tmp, otherwise ghc tries to write them to the nix store
      "-odir /tmp" # place object files in /tmp, otherwise ghc tries to write them to the nix store
      "-i${xmonad-contexts}" # tell ghc to search in the respective nix store path for the module
    ];
    config = builtins.readFile ../path/to/xmonad.hs;

  };

}
