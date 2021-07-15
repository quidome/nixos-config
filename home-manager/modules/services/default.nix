{ config, pkgs, ... }:

{
  imports = [
    ./flameshot.nix
    ./gpg-agent.nix
  ];
}
