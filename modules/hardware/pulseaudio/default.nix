{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.settings.pulseaudio;
in
{
  options.settings.pulseaudio = {
    enable = mkEnableOption "Enable pulseaudio configuration";
  };

  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.package = pkgs.pulseaudioFull;
  };
}
