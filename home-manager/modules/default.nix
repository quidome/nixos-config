{ config, pkgs, ... }:

{
  imports = [
    ./my.nix
    ./basics.nix
    ./gui
    ./programs
    ./services
    ./user
    ./xorg
  ];
}
