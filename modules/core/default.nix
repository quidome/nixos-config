{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ./cli.nix
  ];
}
