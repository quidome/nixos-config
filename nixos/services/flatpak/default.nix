{ config, pkgs, lib, ... }:
with lib;
{
  config = mkIf config.custom.flatpak.enable {
    services.flatpak.enable = true;

    xdg.portal.enable = true;
  };
}
