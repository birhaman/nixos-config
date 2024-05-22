{ config, pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    (stdenv.mkDerivation rec {
      pname = "torrserver";
      version = "128";
      src = fetchFromGithub {
        owner = "YouROK";
        repo = "TorrServer";
        rev = "";
      }
    })

    # mosquitto
    # prosody

  ];

}
