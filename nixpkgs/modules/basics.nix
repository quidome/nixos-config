{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # basics
    ldns
    jq
    yq
    gopass
    rcm           # dotfile manager
    # a bunch of rust tools replacing good old stuff
    procs # ps
    ytop # system monitor
    exa
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.bat = {
    enable = true;
    config.theme = "DarkNeon";
    config.style = "header,snip";
  };


  programs.home-manager.enable = true; 
  programs.ssh.enable = true;

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
