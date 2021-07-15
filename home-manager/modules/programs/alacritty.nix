{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.my.programs.alacritty;
in
{
  options.my.programs.alacritty = {
    enable = mkEnableOption "Enable alacritty";
  };

  config = mkIf cfg.enable {
    programs.alacritty.enable = true;

    # manage config files
    xdg.configFile = {
      "alacritty/alacritty.yml".source = ./alacritty/alacritty.yml;
    };
  };
}
