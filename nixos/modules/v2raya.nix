{ config, pkgs, ... }:

{
  services.v2raya = {
    enable = true;
  };

  networking.firewall = {
    allowedTCPPorts = [ 2017 ];
  };

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.route_localnet" = 1;
  };

}
