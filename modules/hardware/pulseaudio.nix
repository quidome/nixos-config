{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.my.hardware.pulseaudio;
in
{
  options.my.hardware.pulseaudio = {
    enable = mkEnableOption "Enable pulseaudio configuration";
  };

  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.package = pkgs.pulseaudioFull;
  };
}
