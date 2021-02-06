{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # basics
    tmux
    ldns
    jq
    yq
    gopass
    # a bunch of rust tools replacing good old stuff
    procs # ps
    ytop # system monitor
    exa
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs = {
    bat.enable = true;
    bat.config.theme = "DarkNeon";
    bat.config.style = "header,snip";

    home-manager.enable = true; 
  };

  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      defaultCacheTtl = 86400;
      maxCacheTtl = 86400;
      maxCacheTtlSsh = 86400;
      defaultCacheTtlSsh = 86400;
    };
  };
}
