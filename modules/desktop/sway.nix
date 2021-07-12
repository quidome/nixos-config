{ config, pkgs, lib, ... }:
{
  config = lib.mkIf (config.my.desktop == "sway") {
    services.xserver.displayManager.startx.enable = true;

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true; # so that gtk works properly
      extraPackages = with pkgs; [
        swaylock
        swayidle
        wl-clipboard
        mako # notification daemon
        alacritty # Alacritty is the default terminal in the config
        dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native

        # packages required for my desktop
        wofi
        waybar
        mako
        kanshi
        slurp
        grim
        brightnessctl
        pamixer
      ];
    };

    fonts.fonts = with pkgs; [ font-awesome ];

    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
        ];
        gtkUsePortal = true;
      };
    };
  };
}
