{ config, pkgs, ... }:

let
  ip_mgt = "172.16.10.64";
  ip_lan = "172.16.40.64";
in {
  # disable dhcp for all interfaces
  networking.useDHCP = false;

  networking.interfaces.enp2s0f0.useDHCP = false;
  networking.interfaces.vlan40.useDHCP = false;

  # vlan configuration
  networking.vlans.vlan40.interface = "enp2s0f0";
  networking.vlans.vlan40.id = 40;

  # static ip config
  networking.interfaces.enp2s0f0.ipv4.addresses = [ { address = ip_mgt; prefixLength = 24; } ];
  networking.interfaces.vlan40.ipv4.addresses = [ { address = ip_lan; prefixLength = 24; } ];

  # routing and resolving
  networking.defaultGateway = "172.16.40.1";
  networking.nameservers = ["172.16.40.1" "172.16.10.1"];
  networking.search = ["lan.balti.casa" "mgt.balti.casa" "balti.casa"];
}
