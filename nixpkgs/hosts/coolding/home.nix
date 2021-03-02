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
    ./secret.nix
  ];

  # feature toggles
  elemental.home.program.terminal.tmux.enable = true; 

  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # dev
    exercism

    # media
    kdenlive
  ];
}
