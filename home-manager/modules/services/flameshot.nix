{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.settings.services.flameshot;
in
{
  options.settings.services.flameshot = {
    enable = mkEnableOption "Enable flameshot";
  };

  config = mkIf cfg.enable {
    services.flameshot.enable = true;
  };
}
