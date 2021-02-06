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
  my_network = "wpa";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
    # "net.ipv6.conf.wlp2s0.disable_ipv6" = true;
  };

  boot.initrd.luks.devices = {
    enc-pv = {
      device = "/dev/disk/by-uuid/6626af74-0265-4f93-ad1f-58bb821fe485";
      preLVM = true;
    };
  };

  networking.hostName = "linux-10194"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    # network
    freerdp
    krb5
    openconnect
    perl532Packages.AppClusterSSH
    tmux-cssh
    filezilla
    lftp
    openssl

    # cloud stuff
    k9s
    kubectx
    stern

    # dev tools
    gitAndTools.gitflow
    ruby_2_5
    vagrant

    # python setup
    black
    (python38.withPackages (ps:
      with ps; [
        flake8
        pip
        requests
        ruamel_yaml
        termcolor
        virtualenvwrapper
        yamllint
      ]))

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

  #   grafana = {
  #     enable = true;
  #   };

  #   prometheus = {
  #     enable = true;
  #     exporters.node = {
  #       enable = true;
  #       enabledCollectors = [ "systemd" ];
  #     };

  #     scrapeConfigs = [
  #     {
  #       job_name = "linux-10194";
  #       scrape_interval = "30s";
  #       static_configs = [{
  #         targets = [ "127.0.0.1:${toString config.services.prometheus.exporters.node.port}" ];
  #       }];
  #     }
  #   ];
  #   };
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
