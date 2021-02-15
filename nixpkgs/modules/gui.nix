{ config, pkgs, ... }:

{
  # setup programs
  programs = {
    alacritty.enable = true;
  };

  # setup services
  services = {
    flameshot.enable = true;
  };

  # manage config files
  xdg.configFile = {
    "alacritty/alacritty.yml".source = ../xdg-config/alacritty.yml;
  };
}
