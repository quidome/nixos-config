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
    ../../services
    #../../services/audio/pipewire
  ];

  custom = {
    desktop = "i3";
    wpa.enable = true;

    flatpak.enable = true;
    pipewire.enable = false;
  };

  networking.hostName = "coolding"; # Define your hostname.

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
  };

  # deal with apple keyboard
  boot.extraModprobeConfig = ''
    options hid_apple swap_opt_cmd=1
    options hid_apple swap_fn_leftctrl=1
  '';

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  # install packages unique for this host
  environment.systemPackages = with pkgs; [
    discord
    cointop
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

    xserver.videoDrivers = [ "modesetting" ];
  };

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}