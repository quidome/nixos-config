{ config, pkgs, lib, ... }:
with lib;
{
  options.settings.gui.environment = mkOption {
    type = with types; enum ["kde" "i3"];
    default = "";
    description = ''
      Which gui environment to configure. Determines which extra settings will be applied.
    '';
    example = "kde";
  };

  imports = [
    ./i3.nix
    ./kde.nix
  ];
}
