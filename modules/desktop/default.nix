{ config, pkgs, ... }:

{
  imports = [
    ./gnome.nix
    ./i3.nix
    ./kde.nix
    ./pkgs.nix
    ./sway.nix
    ./xserver.nix
  ];
}
