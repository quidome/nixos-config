{ config, pkgs, ... }:

{
  imports = [
    ./gui
    ./xorg
    ./programs
    ./services
    ./settings.nix
    ./user
  ];
}
