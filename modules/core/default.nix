{ config, pkgs, ... }:

{
  imports = [
    ./options.nix
    ./base.nix
    ./cli.nix
  ];
}
