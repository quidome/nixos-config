{ config, pkgs, ... }:

let
  user = "quidome";
  userHome = "/home/${user}";
  hostname = "coolding";
in {
  imports = [
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/i3.nix
    ./gnome.nix
    ./secret.nix
  ];

  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # base
    rcm

    # dev
    exercism
    meld
    vscode
    emacs
    nanum-gothic-coding

    # net
    element-desktop
    tdesktop
    signal-desktop

    # media
    gimp
    zathura
    spotify
  ];

  programs = {
    rofi.enable = true;
    rofi.theme = "Pop-Dark.rasi";

    ssh.enable = true;
  };
}
