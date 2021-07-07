{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.my.programs.zsh;
in
{
  options.my.programs.zsh = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf cfg.enable {

    home.file.".zprompt".source = ./zsh/zprompt;
    home.file.".zcolors".source = ./zsh/zcolors;

    xdg.configFile."zsh/zprompt".source = ./zsh/zprompt;
    xdg.configFile."zsh/zcolors".source = ./zsh/zcolors;

    programs.zsh = {
      enable = true;

      dotDir = ".config/zsh";

      enableCompletion = true;
      enableAutosuggestions = true;
      history = {
        size = 50000;
        save = 50000;
        ignoreDups = true;
      };

      defaultKeymap = "emacs";

      initExtra = ''
        if [ -d $HOME/.env.d ]; then
          for i in $HOME/.env.d/*.sh; do
            if [ -r $i ]; then
              . $i
            fi
          done
          unset i
        fi

        source $HOME/.config/zsh/zprompt
      '';
    };
  };
}
