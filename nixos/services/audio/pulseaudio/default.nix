{ config, pkgs, lib, ... }:
with lib;
{
  config = mkIf (! config.use_pipewire) {
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.package = pkgs.pulseaudioFull;
  };
}
