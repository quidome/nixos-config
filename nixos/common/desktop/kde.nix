{ config, pkgs, lib, ... }:


with lib;
{
  config = mkIf (config.custom.desktop == "kde") {

    # hardware required for plasma
    hardware = {
      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;
    };

    # services required for plasma
    services = {
      avahi.enable = true;
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
        kdeApplications.spectacle
        kdeApplications.kompare
        kate
        ark
        kdeplasma-addons
        gwenview

        # gnupg
        kgpg
      ];
    };
  };
}
