{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.settings.xorg;
in
{
  options.settings.xorg = {
    enable = mkEnableOption "Enable xorg configuration";
  };

  config = mkIf cfg.enable {
    # Configuration shared between all xorg enabled configs
    programs.rofi = {
      enable = true;
      theme = "Pop-Dark.rasi";
    };
  };
}
