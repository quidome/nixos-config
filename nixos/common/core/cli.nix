{ config, pkgs, ... }:

{
  # set default shell for all users
  # users.defaultUserShell = pkgs.zsh;

  # Basic command line setup
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    systemPackages = with pkgs; [
      # the core essentials
      vim
      htop
      lsof

      # network
      openconnect
      rdesktop
      wget
      curl

      # handy tools
      bat
      docker-compose
      exa
      fzf
      fzf
      httpie
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

      # # python stuff
      # black
      # (python38.withPackages(ps: with ps; [
      #   virtualenvwrapper
      # ]))
    ];
  };
}
