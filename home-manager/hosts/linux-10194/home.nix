{ config, pkgs, ... }:

let
  user = "qmeijer";
  userHome = "/home/${user}";
  hostname = "linux-10194";
in
{
  imports = [
    ./secret.nix
    ../../modules
  ];

  # home manager required settings
  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "21.05";

  my = {
    user = user;
    role = "workstation";
    host = hostname;

    gui.environment = "i3";

    # feature toggles
    programs.tmux.enable = true;
    programs.zsh.enable = true;

    services.gpg-agent.enable = true;
    services.gpg-agent.enableSshSupport = true;
  };

  programs.taskwarrior.enable = true;

  # TODO: fix this security issue
  nixpkgs.config.permittedInsecurePackages = [
    "rambox-0.7.7"
  ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # dev
    jetbrains.idea-ultimate
    vagrant
    gitAndTools.gitflow
    asciidoctor

    # net
    freerdp
    lftp
    perl532Packages.AppClusterSSH
    rambox
    teams
    tmux-cssh

    # media
    drawio

    # python setup
    black
    (
      python3.withPackages (
        ps:
          with ps; [
            flake8
            pip
            requests
            ruamel_yaml
            termcolor
            virtualenvwrapper
            yamllint
          ]
      )
    )

    # ruby setup
    ruby
    hiera-eyaml
    gems.pdk
    gems.rubocop
    gems.puppet5
    asciidoc
  ];
}
