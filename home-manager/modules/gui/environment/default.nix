{ config, pkgs, lib, ... }:
with lib;
{
  options.my.gui.environment = mkOption {
    type = with types; enum [ "none" "gnome" "i3" "kde" ];
    default = "none";
    description = ''
      Which gui environment to configure. Determines which extra settings will be applied.
    '';
    example = "kde";
  };

  imports = [
    ./gnome.nix
    ./i3.nix
    ./kde.nix
  ];
}
