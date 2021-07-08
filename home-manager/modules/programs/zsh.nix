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

    programs.zsh = {
      enable = true;

      enableCompletion = true;
      enableAutosuggestions = true;
      history = {
        size = 50000;
        save = 50000;
        ignoreDups = true;
      };

      defaultKeymap = "emacs";

      initExtraFirst = ''
        # autostart X when on tty1 and not root
        if [[ ! $UID = 0 ]] && [[ ''$(tty) = "/dev/tty1" ]] && command -v startx >/dev/null; then
          exec startx
        fi
      '';

      initExtra = ''
        # source all .sh file in .env.d
        if [ -d "$HOME"/.env.d ]; then
          for i in "$HOME"/.env.d/*.sh; do
            if [ -r $i ]; then
              . $i
            fi
          done
          unset i
        fi

        source ~/.zprompt

        zstyle -s ':completion:*:hosts' hosts _ssh_config
        [[ -r "$BOLCOM_HOSTS" ]] && _ssh_config+=($(cat "$BOLCOM_HOSTS"))
        zstyle ':completion:*:hosts' hosts $_ssh_config

        if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
            alias clear='printf "\e]51;Evterm-clear-scrollback\e\\";tput clear'
        fi
      '';
    };
  };
}
