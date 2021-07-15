{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.my.programs.git;
in
{
  options.my.programs.git = {
    enable = lib.mkEnableOption "Enable git";

    userEmail = lib.mkOption {
      type = types.lines;
      description = "The git config email";
      default = "";
    };

    userName = lib.mkOption {
      type = types.lines;
      description = "The git config name";
      default = "";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userEmail = cfg.userEmail;
      userName = cfg.userName;
      #delta.enable = true;
      extraConfig = {
        core.excludesfile = "${config.home.homeDirectory}/.gitignore_global";
        # Force SSH
        #        url = {
        #          "git@gitlab.bol.io:" = {
        #            insteadOf = "https://gitlab.bol.io/";
        #          };
        #        };
        branch.autosetuprebase = "always";
        color.ui = "auto";
        diff.tool = "meld";
        difftool.prompt = false;
        difftool = {
          "meld" = {
            cmd = "meld \"$LOCAL\" \"$REMOTE\"";
          };
        };
        pull.rebase = true;
        rebase.autoStash = true;
      };
      # Aliases
      aliases = {
        "dt" = "difftool --tool=meld --dir-diff";
        "praise" = "blame";
      };
    };
  };
}
