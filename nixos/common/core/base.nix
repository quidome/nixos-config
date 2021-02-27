{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IE.UTF-8";

  # disable obsolete configuration method
  networking.useDHCP = false;

  programs = {
    gnupg.agent.enable = true;
    zsh.enable = true;
  };

  services = {
    openssh.enable = true;
    fwupd.enable = true;
  };

  # needed for non-free software like vs code, spotify
  nixpkgs.config.allowUnfree = true;
}
