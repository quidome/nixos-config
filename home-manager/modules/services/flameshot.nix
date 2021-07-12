{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.my.services.flameshot;
in
{
  options.my.services.flameshot = {
    enable = mkEnableOption "Enable flameshot";
  };

  config = mkIf cfg.enable {
    services.flameshot.enable = true;
  };
}
