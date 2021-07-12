{ config, pkgs, ... }:

{
  imports = [
    ./my.nix
    ./basics.nix
    ./gui
    ./programs
    ./services
    ./settings.nix
    ./user
    ./xorg
  ];
}
