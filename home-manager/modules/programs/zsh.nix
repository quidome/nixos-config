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
    };
  };
}
