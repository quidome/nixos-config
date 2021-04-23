{ config, pkgs, ... }:

{
  # Basic command line setup
  environment.systemPackages = with pkgs; [
      # base
      vim
      htop
      lsof
      file

      # network
      wget
      curl
      httpie
      ldns

      # cloud
      k9s
      kubectx
      stern

      # handy tools
      bat
      docker-compose
      exa
      fzf
      gopass
      ipcalc
      jq
      nixfmt
      procs # ps
      rcm           # dotfile manager
      ripgrep
      yq
      ytop # system monitor
      unzip
    
      # dev tools
      binutils-unwrapped
      gnumake
      gcc
      git
      git-crypt
      gitAndTools.tig
      shellcheck
      go
      dep
      exercism
      linuxPackages.bpftrace
    ];
}
