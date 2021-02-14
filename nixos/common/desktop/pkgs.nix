{ config, pkgs, lib, ... }:

with lib;
{
  environment.systemPackages =
    if config.services.xserver.enable then with pkgs; [
      # web
      firefox
    ]
    else
    [ ];

  programs.firejail = {
    enable = false;
    wrappedBinaries = {
      firefox = "${lib.getBin pkgs.firefox}/bin/firefox";
      mpv = "${lib.getBin pkgs.mpv}/bin/mpv";
    };
  };
}
