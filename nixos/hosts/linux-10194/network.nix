{ config, lib, ... }: {
  config = lib.mkMerge [
    ( lib.mkIf (config.my_network == "nm") {
      # configuration for using networkmanager
      networking.networkmanager.enable = true;
    })

    ( lib.mkIf (config.my_network == "wpa") {
      # configuration for wpa supplicant
      networking.wireless.enable = true;
      networking.interfaces.enp0s31f6.useDHCP = true;
      networking.interfaces.wlp2s0.useDHCP = true;
      networking.interfaces.enp0s20f0u1u2u3.useDHCP = true;
    })
  ];
}
