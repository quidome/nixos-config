{ config, pkgs, ... }:

let
  user = "qmeijer";
  userHome = "/home/${user}";
  hostname = "linux-10194";
in {
  imports = [
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/gui.nix
    ../../modules/i3.nix
    #./gnome.nix
    ./secret.nix
  ];

  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # dev
    exercism
    jetbrains.idea-ultimate

    # net
    rambox
    teams

    # media
    drawio
  ];
}
