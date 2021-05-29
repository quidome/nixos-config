{ config, lib, ... }: {
  config = lib.mkMerge [

    ( lib.mkIf config.custom.wpa.enable {
      # configuration for wpa supplicant
      networking.wireless.enable = true;
      networking.interfaces.enp1s0f0.useDHCP = true;
      networking.interfaces.wlp2s0.useDHCP = true;

      networking.networkmanager.enable = false;
    })

    ( lib.mkIf (! config.custom.wpa.enable) {
      # configuration for using networkmanager
      networking.networkmanager.enable = true;
    })
  ];
}
