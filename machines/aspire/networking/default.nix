{ config, pkgs, lib, modulesPath, ... }: {
  networking = {
    hostName = "aspire";
    hostId = "a5ce8624";

    interfaces.enp3s0 = {
      useDHCP = true;
      # ipv4.routes = [{
      #   address = "94.158.219.101";
      #   prefixLength = 24;
      #   via = "192.168.0.1";
      # }];
    };
    useDHCP = lib.mkDefault true;

    networkmanager = {
      enable = true; # Easiest to use and most distros use this by default.
      plugins = with pkgs; [
      #   networkmanager-openvpn
      #   networkmanager-openconnect
      ];
    };

    dhcpcd.extraConfig = "nohook resolv.conf";

    nameservers = [
    # OpenNIC
      "45.84.1.149"
    # dismail.de [https://dismail.de/info.html#dns]
      "116.203.32.217" "159.69.114.157"
      # "2a01:4f8:1c1b:44aa::1" "2a01:4f8:c17:739a::2	"
    # Cloudflare & Google
      "1.1.1.1" "8.8.8.8"
    ];

    firewall.enable = true;
    firewall = {
      allowedTCPPorts = [
        80 443
        3128
        4455 # OBS Blade
        9050
        42994 # Simplex
        62180

        63579
      ];
      allowedTCPPortRanges = [
        { from = 6881; to = 6889; }
        { from = 27015; to = 27050; }
      ];

      allowedUDPPorts = [
        3478
        4380
      ];
      allowedUDPPortRanges = [
        { from = 4000; to = 4007; }
        { from = 8000; to = 8010; }
        { from = 27000; to = 27100; }
      ];

      interfaces = {

      };
    };

  };

  # Firewall choice

  security.pki.certificateFiles = [
    # Russian certs («Министерство цифрового развития»)
    "/usr/share/pki/russian_trusted_root_ca_pem.crt"
    "/usr/share/pki/russian_trusted_sub_ca_pem.crt"
  ];

# Custom network name assigning
  # systemd.network = {
  #   links."10-wan" = {
  #     matchConfig.PermanentMACAddress = "52:54:00:12:01:01";
  #     linkConfig.Name = "wan";
  #   };
  # };

  # boot.initrd = {
  #   services.udev.rules = ''
  #     SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", \
  #     ATTR{address}=="52:54:00:12:01:01", KERNEL=="eth*", NAME="wan"
  #   '';
  # };

}
