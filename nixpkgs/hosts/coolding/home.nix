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
    # base
    rcm

    # dev
    linuxPackages.bpftrace
    exercism
    meld
    vscode
    emacs
    nanum-gothic-coding # spacemacs fallback font

    # net
    element-desktop
    tdesktop
    signal-desktop
    chromium

    # media
    gimp
    zathura
    spotify
    mpv
    peek

    # cloud
    k9s
    kubectx
    stern
  ];

  programs = {
    git = {
      enable = true;
      userName = "quidome";
      userEmail = "quidome@gmail.com";
    };

    rofi.enable = true;
    rofi.theme = "Pop-Dark.rasi";

    ssh.enable = true;
  };
}
