{ config, pkgs, ... }:

{
  # Basic command line setup
  environment.systemPackages = with pkgs; [
    # base
    file
    htop
    lsof
    openssl
    pwgen
    vim

    # network
    ncat
    curl
    httpie
    ldns
    wget

    # cloud
    k9s
    kubectx
    stern

    # handy tools
    bat
    bottom
    cointop
    docker-compose
    exa
    fzf
    gopass
    ipcalc
    jq
    # nixfmt
    nixpkgs-fmt
    procs # ps
    rcm # dotfile manager
    ripgrep
    unzip
    yq

    # dev tools
    binutils-unwrapped
    dep
    exercism
    gcc
    git
    git-crypt
    gitAndTools.tig
    gnumake
    go
    linuxPackages.bpftrace
    shellcheck
  ];
}
