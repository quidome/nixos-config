{ config, pkgs, ... }:

let
  user = "qmeijer";
  userHome = "/home/${user}";
  hostname = "linux-10194";
in {
  imports = [
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/gui.nix
    ../../modules/i3.nix
    ./secret.nix
  ];

  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # dev
    gitAndTools.gitflow
    jetbrains.idea-ultimate
    ruby_2_5
    vagrant

    # net
    filezilla
    freerdp
    krb5
    lftp
    openconnect
    openssl
    perl532Packages.AppClusterSSH
    rambox
    teams
    tmux-cssh

    # media
    drawio

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
}
