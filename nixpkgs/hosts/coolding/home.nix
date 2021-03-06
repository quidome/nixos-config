{ config, pkgs, ... }:

let
  user = "quidome";
  userHome = "/home/${user}";
  hostname = "coolding";
in {
  imports = [
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/gui.nix
    ../../modules/i3.nix
    ../../program
    ../../role
    ../../role/de/gnome
    ./secret.nix
  ];

  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  # elemental setup
  elemental.user = user;
  elemental.role = "workstation";
  elemental.machine = hostname;

  # feature toggles
  elemental.program.terminal.tmux.enable = true;
  elemental.role.de.gnome.enable = true;

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # dev
    exercism

    # media
    kdenlive
  ];
}
