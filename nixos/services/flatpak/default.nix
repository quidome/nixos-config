{ config, pkgs, lib, ... }:
with lib;
{
  config = mkIf config.use_flatpak {
    services.flatpak.enable = true;

    xdg.portal.enable = true;
  };
}
