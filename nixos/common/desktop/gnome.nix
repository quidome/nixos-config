{ config, pkgs, lib, ... }:

with lib; {
  config = mkIf (config.desktop == "gnome") {

    # use gdm and gnome-shell
    services.xserver = {
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = false;
      desktopManager.gnome3.enable = true;
    };

    programs.gnupg.agent.pinentryFlavor = "gnome3";

    # add extra packages to this desktop setup
    environment = {
      # add some desktop applications
      systemPackages = with pkgs; [
        # theming
        arc-icon-theme
        arc-theme

        # gnome tweaks
        gnome3.gnome-tweaks
        guake
        gnomeExtensions.dash-to-dock
        gnomeExtensions.emoji-selector
        gnomeExtensions.sound-output-device-chooser
      ];

      # GTK3 global theme (widget and icon theme)
      etc."xdg/gtk-3.0/settings.ini" = {
        text = ''
          [Settings]
          gtk-icon-theme-name=Arc
          gtk-theme-name=Arc-dark
          gtk-application-prefer-dark-theme = true
        '';
      };
    };
  };
}
