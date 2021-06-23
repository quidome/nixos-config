{ config, pkgs, ... }:

let
  user = "quidome";
  userHome = "/home/${user}";
  hostname = "coolding";
in {
  imports = [
    ./secret.nix
    ../../elemental.nix
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/gui.nix
    ../../modules/sway.nix
    ../../program
    ../../user
  ];

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
  elemental.program.wm.i3.enable = false;

  nixpkgs.config.allowUnfree = true;
}
