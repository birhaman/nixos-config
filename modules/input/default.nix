{ config, pkgs, modulesPath, ... }:
  let
   compiledLayout = pkgs.runCommand "keyboard-layout" {} ''
    ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${./xkb/symbols/omeiro_mit.xkb} $out
  ''; in {
  i18n.inputMethod = {
      enabled = "fcitx5";
      # uim.toolbar = "qt5";
      fcitx5.addons = with pkgs; [
          fcitx5-rime
          fcitx5-anthy
          fcitx5-hangul
          fcitx5-gtk fcitx5-lua
          libsForQt5.fcitx5-qt
          fcitx5-chinese-addons fcitx5-with-addons
          fcitx5-table-extra fcitx5-table-other
        ];
  };

  services = {
    xserver = {
      xkb = {
        variant = "colemak,";
        model = "pc105";
        layout = "us,ru";
        extraLayouts.omeiro_mit = {
          description = "Colemak multi-language layout";
          languages = [ "eng" "rus" "ell" "ara" ];
          symbolsFile = ./xkb/symbols/omeiro_mit.xkb;
        };
      };

      synaptics.enable = true;
      synaptics = {
        additionalOptions = ''
         Option "VertScrollDelta "-100"
         Option "HorizScrollDelta "-100"
      '';
        twoFingerScroll = true;
        vertEdgeScroll = false;
        # horizEdgeScroll = false;
        vertTwoFingerScroll = false;
        horizTwoFingerScroll = false;

        # accelFactor = "";
        # minSpeed = "";
        # maxSpeed = "";
      };


    };
    # Synaptics & Libinput are incompatible.
    libinput.enable = false;

  };
}
