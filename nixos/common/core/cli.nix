{ config, pkgs, ... }:

{
  # Basic command line setup
  environment.systemPackages = with pkgs; [
      # base
      vim
      htop
      lsof

      # network
      wget
      curl
      httpie

      # handy tools
      bat
      docker-compose
      exa
      fzf
      ipcalc
      nixfmt
      ripgrep

      # dev tools
      git
      git-crypt
      gitAndTools.tig
      gnumake
      shellcheck
      go
      dep
    ];
}
