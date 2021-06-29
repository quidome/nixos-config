{ config, pkgs, ... }:

let
  user = "quidome";
  userHome = "/home/${user}";
  hostname = "coolding";
in
{
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
  elemental.user = user;
  elemental.role = "workstation";
  elemental.host = hostname;

  # feature toggles
  elemental.program.terminal.tmux.enable = true;
  elemental.program.de.gnome.enable = false;

  settings = {
    gui.environment = "i3";
  };
}
