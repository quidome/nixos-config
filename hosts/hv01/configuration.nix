# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  ip_mgt = "172.16.10.64";
  ip_lan = "172.16.40.64";
in
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./zfs-configuration.nix
      ./nfs.nix
      ./secrets.nix
      ./network.nix
      ../../modules
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hv01"; # Define your hostname.

  # Programs config
  programs = {
    gnupg.agent.pinentryFlavor = "curses";
  };

  # enable sound
  sound.enable = true;

  # disable firewall
  networking.firewall.enable = false;

  # enable docker + metrics
  virtualisation.docker = {
    enable = true;
    extraOptions = "--experimental --metrics-addr=${ip_mgt}:9323";
  };

  # enable prometheus node exporter
  services.prometheus.exporters.node = {
    enable = true;
    listenAddress = ip_mgt;
  };

  # enable cadvisor exporter
  services.cadvisor = {
    enable = true;
    listenAddress = ip_mgt;
  };

  services.spotifyd = {
    enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}
