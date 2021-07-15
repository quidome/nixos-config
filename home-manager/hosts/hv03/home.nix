{ config, pkgs, ... }:

let
  user = "quidome";
  userHome = "/home/${user}";
  hostname = "hv03";
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
    role = "server";
    host = hostname;

    programs.tmux.enable = true;
    programs.zsh.enable = true;
  };
}
