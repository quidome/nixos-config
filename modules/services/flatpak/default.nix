{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.settings.flatpak;
in
{
  options.settings.flatpak.enable = mkEnableOption "Enable flatpak";

  config = mkIf config.settings.flatpak.enable {
    services.flatpak.enable = true;

    xdg.portal.enable = true;
  };
}
