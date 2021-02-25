{ config, pkgs, ... }:

{
  # packages to install
  home.packages = with pkgs; [
    # base
    xclip

    # dev
    emacs
    exercism
    linuxPackages.bpftrace
    meld
    nanum-gothic-coding # spacemacs fallback font
    vscode

    # net
    chromium
    element-desktop
    signal-desktop
    tdesktop

    # media
    gimp
    mpv
    peek
    spotify
    zathura

    # cloud
    k9s
    kubectx
    stern
  ];

  # setup programs
  programs.termite = {
      enable = true;

      allowBold = true;
      audibleBell = false;
      clickableUrl = true;
      cursorBlink = "system";
      cursorShape = "block";
      dynamicTitle = true;
      filterUnmatchedUrls = true;
      font = "Source Code Pro Medium 10";
      mouseAutohide = false;
      scrollOnKeystroke = true;
      scrollOnOutput = false;
      scrollbackLines = 10000;
      scrollbar = "off";
      searchWrap = true;
      urgentOnBell = true;

      colorsExtra = ''
        color0  = #403e41
        color8  = #727072
        color1  = #ff6188
        color9  = #ff6188
        color2  = #a9dc76
        color10 = #a9dc76
        color3  = #ffd866
        color11 = #ffd866
        color4  = #fc9867
        color12 = #fc9867
        color5  = #ab9df2
        color13 = #ab9df2
        color6  = #78dce8
        color14 = #78dce8
        color7  = #fcfcfa
        color15 = #fcfcfa
      '';
  };

  programs.rofi = {
    enable = true;
    theme = "Pop-Dark.rasi";
  };

  # setup services
  services = {
    flameshot.enable = true;
  };
}
