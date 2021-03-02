# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./network.nix
    ./secret.nix
    ../../common
  ];

  desktop = "i3";
  use_wpa = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
  };

  boot.initrd.luks.devices = {
    enc-pv = {
      device = "/dev/disk/by-uuid/6626af74-0265-4f93-ad1f-58bb821fe485";
      preLVM = true;
    };
  };

  networking.hostName = "linux-10194"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    # essential packages for this machine
    openconnect
  ];

  # use gnupg agent for ssh
  programs = {
    gnupg.agent.enableSSHSupport = true;
    ssh.startAgent = false;
  };

  # List services that you want to enable:
  services = {
    printing.enable = true;
    logind.extraConfig = "HandlePowerKey=suspend";
  };


  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
