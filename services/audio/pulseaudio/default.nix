{ config, pkgs, lib, ... }:
with lib;
{
  config = mkIf (! config.custom.pipewire.enable) {
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.package = pkgs.pulseaudioFull;
  };
}
