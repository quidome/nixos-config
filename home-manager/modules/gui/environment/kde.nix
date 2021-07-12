{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.my.gui;
in
{
  config = mkIf (cfg.environment == "kde") {
    # Configuration shared between all xorg enabled configs
    my.xorg.enable = true;
    my.services.flameshot.enable = true;
  };
}
