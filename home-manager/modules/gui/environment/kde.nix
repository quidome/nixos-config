{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.my.gui;
in
{
  config = mkIf (cfg.environment == "kde") {
    # Configuration shared between all xorg enabled configs
    settings.xorg.enable = true;
    settings.services.flameshot.enable = true;
  };
}
