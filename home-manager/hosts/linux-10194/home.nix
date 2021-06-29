{ config, pkgs, ... }:

let
  user = "qmeijer";
  userHome = "/home/${user}";
  hostname = "linux-10194";
in {
  imports = [
    ./secret.nix
    ../../modules
    ../../elemental.nix
    ../../modules/basics.nix
    ../../modules/vim
    ../../program
    ../../user
  ];

  # home manager required settings
  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "21.05";

  # elemental setup
  elemental = {
    user = user;
    role = "workstation";
    host = hostname;

    # feature toggles
    program.terminal.tmux.enable = true;
    program.de.gnome.enable = false;
  };

  settings = {
    gui.environment = "kde";
  };

  programs.taskwarrior.enable = true;

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ruby hiera-eyaml
    gems.pdk
    gems.rubocop
    gems.puppet5
    asciidoc
  ];
}
