{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
