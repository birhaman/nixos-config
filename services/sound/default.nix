{ config, pkgs, lib, ... }: {
  # Enable sound
  sound.enable = true;
  # Use pipeware to emulate jack and pulseaudio
  services.pipewire = {
    enable = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
  };

  hardware = {
    pulseaudio.enable = false;
  };

    # Use noisetorch (RNnoise) to create a virtual source with noise removal
    # programs.noisetorch.enable = true;


    # environment.etc."wireplumber/main.lua.d/90-suspend-timeout.lua" = {
    #   text = ''
    #     session.suspend-timeout-seconds = 0
    #   '';
    # };

}
