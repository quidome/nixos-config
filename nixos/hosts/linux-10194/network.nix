{ config, lib, ... }: {
  config = lib.mkMerge [{
    # disable generic dhcp
    networking.useDHCP = false;

    # disable ipv6
    networking.enableIPv6 = false;
  }
  ( lib.mkIf (config.my_network == "nm") {
    # configuration for using networkmanager
    networking.wireless.enable = false;
    networking.interfaces.enp0s31f6.useDHCP = false;
    networking.interfaces.wlp2s0.useDHCP = false;

    # network manager configuration
    networking.networkmanager.enable = true;
 })

  ( lib.mkIf (config.my_network == "wpa") {
    # configuration for wpa supplicant
    networking.wireless.enable = true;
    networking.interfaces.enp0s31f6.useDHCP = true;
    networking.interfaces.wlp2s0.useDHCP = true;
  })
  ];
}
