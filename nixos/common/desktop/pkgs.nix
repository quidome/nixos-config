{ config, pkgs, lib, ... }:

{
  config = lib.mkIf (config.services.xserver.enable) {
    environment.systemPackages = with pkgs; [
      # base
      xclip

      # dev
      emacs
      nanum-gothic-coding # spacemacs fallback font
      exercism
      linuxPackages.bpftrace
      meld
      vscode

      # net
      firefox
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
      kdenlive
      pavucontrol

      # cloud
      k9s
      kubectx
      stern
    ];

    programs.firejail = {
      enable = true;
      wrappedBinaries = {
        #firefox = "${lib.getBin pkgs.firefox}/bin/firefox";
        mpv = "${lib.getBin pkgs.mpv}/bin/mpv";
      };
    };
  };
}
