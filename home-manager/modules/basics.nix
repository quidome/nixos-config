{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs = {
    bat = {
      enable = true;
      config.theme = "DarkNeon";
      config.style = "header,snip";
    };

    exa = {
      enable = true;
      enableAliases = true;
    };

    home-manager.enable = true;
    ssh.enable = true;
  };
}
