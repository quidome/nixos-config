{ config, lib, pkgs, ... }:
with lib;
{
  config = mkIf (config.my.user == "qmeijer") {
    my.programs.git = {
      enable = true;
      userEmail = "qmeijer@bol.com";
      userName = "Quido Meijer";
    };
  };
}
