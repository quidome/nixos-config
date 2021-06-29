{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.settings;
in
{

  options.settings.host = mkOption {
    type = types.str;
    default = "";
    description = ''
      The hostname of the device.
    '';
    example = "boron";
  };

  options.settings.role = mkOption {
    type = with types; enum ["server" "workstation" "homestation"];
    default = "";
    description = ''
      The device role, this determines the window manager and GUI tools to be installed.
    '';
    example = "workstation";
  };

  options.settings.user = mkOption {
    type = types.str;
    default = "";
    description = ''
      The username of the primary user.
    '';
    example = "x";
  };
}
