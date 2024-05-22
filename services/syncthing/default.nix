{ config, pkgs, lib }: {

  services.syncthing = {
    systemService = true;
    enable = true;
    overrideDevices = true;
    overrideFolders = true;

    devices = {
      "device1" = { id = "DEVICE-ID-GOES-HERE"; };
      "device2" = { id = "DEVICE-ID-GOES-HERE"; };
    };
    settings = {
      folders = {
        "Documents" = {        # Name of folder in Syncthing, also the folder ID
          path = "/home/$USER/Documents";    # Which folder to add to Syncthing
          devices = [ "device1" "device2" ];      # Which devices to share the folder with
        };
        "Entries" = {        # Name of folder in Syncthing, also the folder ID
          path = "$EIM_DIR";    # Which folder to add to Syncthing
          devices = [ "device1" "device2" ];      # Which devices to share the folder with
          ignorePerms = false;     # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
        };
        "EmacsDir" = {
          path = "/home/dvm0/.emacs.d";
          devices = [ "device1" ];
        };
        # "Template" = {
        #   path = "/home/dvm0/.emacs.d";
        #   devices = [ "device1" ];
        #   label = "";
        # };
      };

      extraOptions = {
        gui = {
          user = "dvm0";
          passwodrd = "mOg31%rieFyQ_Zynacc"
        };
      };
      extraFlags = {

      };
    };

    dataDir = "/home/dvm0";
    configDir = "/home/dvm0/.config/syncthing";
    group = "";
    user = "dvm0";
    cert = "";

  };

}
