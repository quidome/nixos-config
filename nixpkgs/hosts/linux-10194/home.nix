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
    # base
    rcm

    # dev
    linuxPackages.bpftrace
    exercism
    meld
    vscode
    emacs
    nanum-gothic-coding # spacemacs fallback font
    jetbrains.idea-ultimate

    # net
    element-desktop
    tdesktop
    signal-desktop
    rambox
    teams
    chromium

    # media
    gimp
    zathura
    drawio
    spotify
    mpv
    peek

    # cloud
    k9s
    kubectx
    stern
  ];

  programs = {
    rofi.enable = true;
    rofi.theme = "Pop-Dark.rasi";

    ssh.enable = true;
  };
}
