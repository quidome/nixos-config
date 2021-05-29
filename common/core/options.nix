{ config, pkgs, lib, ... }:

with lib;
{
  options.custom = {
    desktop = mkOption {
      type = types.str;
      default = "none";
      description = "Sets the desktop environment; set to: none or i3.";
    };

    wpa.enable = mkEnableOption "Whether to use wpa_supplicant instead of network manager. Defaults to false";
    flatpak.enable = mkEnableOption "Enable flatpak";
    pipewire.enable = mkEnableOption "Enable pipewire audio. Defaults to false (use pulseaudio)";
  };
}
