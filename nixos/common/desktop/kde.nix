{ config, pkgs, lib, ... }:


with lib;
{
  config = mkIf (config.desktop == "kde") {

    # hardware required for plasma
    hardware = {
      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;
    };

    # services required for plasma
    services = {
      avahi.enable = true;
      accounts-daemon.enable = true;
      printing.enable = true;

      xserver.displayManager = {
        sddm.enable = true;
        #sddm.theme = "breeze";
        defaultSession = "plasma5";
      };

      xserver.desktopManager.plasma5.enable = true;
    };

    programs.gnupg.agent.pinentryFlavor = "qt";

    # add extra packages to this desktop setup
    environment = {
      # add some desktop applications
      systemPackages = with pkgs; [
        # kde apps
        okular
        yakuake
        bluedevil
        kdeApplications.spectacle
        kdeApplications.kompare
        kate
        ark
        kdeplasma-addons
        # pavucontrol
        gwenview

        # gnupg
        kgpg
      ];
    };
  };
}
