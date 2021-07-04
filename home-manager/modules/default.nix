{ config, pkgs, ... }:

{
  imports = [
    ./gui
    ./xorg
    ./services
    ./settings.nix
    ./user
  ];
}
