{ config, pkgs, ... }:

let
  user = "qmeijer";
  userHome = "/home/${user}";
  hostname = "linux-10194";
in {
  imports = [
    ./secret.nix
    ../../elemental.nix
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/gui.nix
    ../../program
    ../../user
  ];

  # home manager required settings
  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  # elemental setup
  elemental = {
    user = user;
    role = "workstation";
    host = hostname;

    # feature toggles
    program.terminal.tmux.enable = true;
    program.de.gnome.enable = false;
    program.wm.i3.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ruby hiera-eyaml
    gems.pdk
    gems.rubocop
    gems.puppet5
    asciidoc
  ];
}