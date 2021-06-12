{ config, pkgs, lib, ... }:

with lib; {
  config = mkIf (config.custom.desktop == "gnome") {

    # use gdm and gnome-shell
    services.xserver = {
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = false;
      desktopManager.gnome.enable = true;
    };

    programs.gnupg.agent.pinentryFlavor = "gnome3";

    # add extra packages to this desktop setup
    environment = {
      # add some desktop applications
      systemPackages = with pkgs; [
        # gnome tweaks
        gnome3.gnome-tweaks
        guake
        gnomeExtensions.dash-to-dock
        gnomeExtensions.emoji-selector
        gnomeExtensions.sound-output-device-chooser
        gjs
      ];
    };
  };
}
