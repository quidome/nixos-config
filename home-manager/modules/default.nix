{ config, pkgs, ... }:

{
  imports = [
    ./basics.nix
    ./gui
    ./programs
    ./services
    ./settings.nix
    ./user
    ./xorg
  ];
}
