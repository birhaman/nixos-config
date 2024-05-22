{ config, pkgs, lib, ... }: {

 i18n.inputMethod = {
   fcitx5 = {
     addons = with pkgs; [
       # fcitx5-keyboard
       fcitx5-rime fcitx5-anthy
       fcitx5-configtool fcitx5-gtk
       fcitx5-chinese-addons fcitx5-with-addons
       fcitx5-lua
     ];
     # Fcitx config
     settings = {
       # inputMethod = {
       # };
       # addons = {

       # };
       globalOptions = {
         # OverrideXkbOption = "False";
         # CustomXkbOption = "/wpa/.work.d/system/nixos-config/modules/input/xkb/symbols/omeiro_mit.xkb";

       };
     };
   };
 };

}
