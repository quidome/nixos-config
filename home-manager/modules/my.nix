{ config, lib, pkgs, ... }:
let
  cfg = config.my;
in
{

  options.my.host = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
      The hostname of the device.
    '';
    example = "boron";
  };

  options.my.role = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
      The device role, this determines the window manager and GUI tools to be installed.
    '';
    example = "workstation";
  };

  options.my.user = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
      The username of the primary user.
    '';
    example = "x";
  };
}
