{ config, pkgs, ... }:

{
  imports = [
    ./xserver.nix
    ./pkgs.nix
    ./gnome.nix
    ./i3.nix
    ./kde.nix
    ./sway.nix
  ];
}
