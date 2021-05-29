{ config, pkgs, lib, ... }:


with lib;
{
  config = mkIf (config.custom.desktop == "sway") {
    # sway related hardware configuration
    hardware = {
      pulseaudio.enable = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;
    };

    services.xserver.displayManager.startx.enable = true;

    programs.sway.enable = true;

    fonts.fonts = with pkgs; [
      font-awesome
    ];
  };
}
