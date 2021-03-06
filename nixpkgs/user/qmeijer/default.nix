{ config, lib, pkgs, ... }:
with lib;
{
  config = mkIf (config.elemental.user == "qmeijer") {
    elemental.program = {
      dev.git = {
        enable = true;
        userEmail = "qmeijer@bol.com";
        userName = "Quido Meijer";
      };
    };
  };
}
