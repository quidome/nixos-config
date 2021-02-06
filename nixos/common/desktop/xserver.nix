{ config, pkgs, lib, ... }:

with lib;
{
  config = mkIf (config.desktop != "none") {
    services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      xkbOptions = "terminate:ctrl_alt_bksp,caps:none";
    };

    fonts.fonts = with pkgs; [
      source-code-pro
      noto-fonts
      noto-fonts-emoji
    ];

  };
}
