{ config, pkgs, ... }:

{
  imports = [
    ./gui
    ./settings
    ./xorg
    ./services
  ];
}
