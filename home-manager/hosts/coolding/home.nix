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
  ];

  # home manager required settings
  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "21.05";

  settings = {
    gui.environment = "gnome";
  };

  my = {
    user = user;
    role = "workstation";
    host = hostname;

    programs.tmux.enable = true;
    programs.zsh.enable = true;
  };
}
