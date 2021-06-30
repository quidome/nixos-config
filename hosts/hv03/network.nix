{ config, pkgs, ... }:

let
  ip_mgt = "172.16.10.65";
  ip_lan = "172.16.40.65";
in
{
  # disable dhcp for all interfaces
  networking.useDHCP = false;

  # vlan configuration
  networking.vlans.vlan40.interface = "enp2s0";
  networking.vlans.vlan40.id = 40;

  # static ip config
  networking.interfaces.enp2s0.ipv4.addresses = [{ address = ip_mgt; prefixLength = 24; }];
  networking.interfaces.vlan40.ipv4.addresses = [{ address = ip_lan; prefixLength = 24; }];

  # routing and resolving
  networking.defaultGateway = "172.16.40.1";
  networking.nameservers = [ "172.16.40.1" "172.16.10.1" ];
  networking.search = [ "lan.balti.casa" "mgt.balti.casa" "balti.casa" ];
}
