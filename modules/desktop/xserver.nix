{ config, pkgs, lib, ... }:
{
  config = lib.mkIf (config.my.desktop != "none") {
    services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      xkbOptions = "terminate:ctrl_alt_bksp,caps:none";
      useGlamor = true;
    };

    fonts.fonts = with pkgs; [
      source-code-pro
      noto-fonts
      noto-fonts-emoji
    ];

  };
}
