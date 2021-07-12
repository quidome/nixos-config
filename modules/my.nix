{ config, lib, ... }:

{
  imports = [
    ./my
  ];

  options.my = {
    desktop = lib.mkOption {
      type = lib.types.str;
      default = "none";
      description = "Sets the desktop environment; set to: none or i3.";
    };

    wpa.enable = lib.mkEnableOption "Whether to use wpa_supplicant instead of network manager. Defaults to false";
    flatpak.enable = lib.mkEnableOption "Enable flatpak";
  };
}
