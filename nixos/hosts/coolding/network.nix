{ config, lib, ... }: {
  config = lib.mkMerge [

    ( lib.mkIf config.use_wpa {
      # configuration for wpa supplicant
      networking.wireless.enable = true;
      networking.interfaces.enp1s0f0.useDHCP = true;
      networking.interfaces.wlp2s0.useDHCP = true;
      networking.interfaces.enp0s20f0u1u2u3.useDHCP = true;
    })

    ( lib.mkIf (! config.use_wpa) {
      # configuration for using networkmanager
      networking.networkmanager.enable = true;
    })
  ];
}
