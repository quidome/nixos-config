{ config, pkgs, lib, ... }:

with lib;
{
  options.custom = {
    desktop = mkOption {
      type = types.str;
      default = "none";
      description = "Sets the desktop environment; set to: none or i3.";
    };
  };
}
