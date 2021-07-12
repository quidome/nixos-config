{ config, lib, ... }:
let
  cfg = config.my.wpa;
in
{
  config = lib.mkMerge [

    (
      lib.mkIf cfg.enable {
        # configuration for wpa supplicant
        networking.wireless.enable = true;
        networking.wireless.interfaces = [ "wlp2s0" ];

        networking.interfaces.enp1s0f0.useDHCP = true;
        networking.interfaces.wlp2s0.useDHCP = true;
        networking.networkmanager.enable = false;
      }
    )

    (
      lib.mkIf (! cfg.enable) {
        # configuration for using networkmanager
        networking.networkmanager.enable = true;
      }
    )
  ];
}
