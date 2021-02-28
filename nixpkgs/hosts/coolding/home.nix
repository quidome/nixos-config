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
    kdenlive
  ];
}
