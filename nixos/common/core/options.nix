{ config, pkgs, lib, ... }:

with lib;
{
  options = {
    # make an option to enable or desable the desktop environment
    desktop = mkOption {
      type = types.str;
      default = "none";
      description = "Sets the desktop environment; set to: none or i3.";
    };

    my_network = mkOption {
      type = types.str;
      default = "none";
      description = "Sets a network setup; set to: none, nm or wpa.";
    };
  };
}
