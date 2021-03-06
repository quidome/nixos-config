{ config, pkgs, ... }:

let
  user = "qmeijer";
  userHome = "/home/${user}";
  hostname = "linux-10194";
in {
  imports = [
    ../../elemental.nix
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/gui.nix
    ../../program
    ../../user
    ./secret.nix
  ];

  # home manager required settings
  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  # elemental setup
  elemental.user = user;
  elemental.host = hostname;
  elemental.role = "workstation";

  # feature toggles
  elemental.program.terminal.tmux.enable = true;
  #elemental.program.de.gnome.enable = true;
  elemental.program.wm.i3.enable = true;

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # dev
    gitAndTools.gitflow
    jetbrains.idea-ultimate
    ruby_2_5
    vagrant
    exercism

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
    kdenlive

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
