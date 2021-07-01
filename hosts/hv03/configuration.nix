# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  # networking configuration
  ip_mgt = "172.16.10.65";
  ip_lan = "172.16.40.65";

  # kubernetes configuration
  kubeMasterIP = ip_lan;
  kubeMasterHostname = "api.kube";
  kubeMasterAPIServerPort = 443;

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

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "hv03"; # Define your hostname.

  # Programs config
  programs = {
    gnupg.agent.pinentryFlavor = "curses";
  };

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

  ### kubernetes setup
  # resolve master hostname
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  # packages for administration tasks
  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = {
    roles = [ "master" "node" ];
    masterAddress = kubeMasterHostname;
    easyCerts = true;
    apiserver = {
      securePort = kubeMasterAPIServerPort;
      advertiseAddress = kubeMasterIP;
    };

    # use coredns
    addons.dns.enable = true;

    # needed if you use swap
    kubelet.extraOpts = "--fail-swap-on=false";
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.05"; # Did you read the comment?
}
