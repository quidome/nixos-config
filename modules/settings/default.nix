{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.settings;
in
{
  imports = [
    ./audio.nix
  ];

  options.settings = {
    host = mkOption {
      type = types.str;
      default = "";
      description = ''
        The hostname of the device.
      '';
      example = "boron";
    };

    role = mkOption {
      type = with types; enum [ "server" "workstation" "homestation" ];
      default = "server";
      description = ''
        The device role, this determines the window manager and GUI tools to be installed.
      '';
      example = "workstation";
    };

    user = mkOption {
      type = types.str;
      default = "";
      description = ''
        The username of the primary user.
      '';
      example = "x";
    };
  };
}
