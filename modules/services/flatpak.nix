{ config, pkgs, lib, ... }:
let
  cfg = config.my.services.flatpak;
in
{
  options.my.services.flatpak.enable = lib.mkEnableOption "Enable flatpak";

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;

    xdg.portal.enable = true;
  };
}
