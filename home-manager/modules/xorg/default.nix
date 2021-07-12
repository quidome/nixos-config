{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.my.xorg;
in
{
  options.my.xorg.enable = mkEnableOption "Enable xorg configuration";

  config = mkIf cfg.enable {
    # Configuration shared between all xorg enabled configs
    programs.rofi = {
      enable = true;
      theme = "Pop-Dark.rasi";
    };
  };
}
