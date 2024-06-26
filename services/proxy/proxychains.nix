{ config, pkgs, lib, ... }: {
  # programs.proxychains = {
  #   enable = true;
  # };
  environment.etc = {
    "proxychains.conf".text =
     ''
 #dynamic_chain
 strict_chain
 #round_robin_chain
 #random_chain
 #chain_len = 2

 #quiet_mode
 proxy_dns
 remote_dns_subnet 224

 tcp_read_time_out 15000
 tcp_connect_time_out 8000
 # localnet 127.0.0.0/255.0.0.0

 # [ProxyList]
 socks4 127.0.0.1 9050
    '';
   };
}
