{ config, pkgs, lib, ... }:


with lib;
{
  config = mkIf (config.custom.desktop == "kde") {

    # services required for plasma
    services = {
      # avahi.enable = true;
      accounts-daemon.enable = true;

      # actual kde stuff
      xserver.displayManager.sddm.enable = true;
      xserver.displayManager.defaultSession = "plasma5";
      xserver.desktopManager.plasma5.enable = true;
    };

    programs.gnupg.agent.pinentryFlavor = "qt";

    # add extra packages to this desktop setup
    environment = {
      # add some desktop applications
      systemPackages = with pkgs; [
        plasma-pa     # needed for managing audio
        # kde apps
        okular
        yakuake
        bluedevil
        spectacle
        kompare
        libsForQt5.dolphin-plugins
        libsForQt5.kipi-plugins
        libsForQt5.kio-extras
        kate
        ark
        kdeplasma-addons
        gwenview
        kde-gtk-config
        sddm-kcm
        krename

        # gnupg
        kgpg
      ];
    };
  };
}
