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

    use_wpa = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to use wpa_supplicant instead of network manager. Defaults to true";
    };
  };
}
