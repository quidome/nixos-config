{ config, pkgs, lib, ... }:

with lib;

# let
#   unstable = import
#     (builtins.fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz)
#     # reuse the current configuration
#     { config = config.nixpkgs.config; };
# in
{
  config = mkIf (config.desktop == "i3") {
    # i3 related hardware configuration
    hardware = {
      pulseaudio.enable = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;
    };

    programs.gnupg.agent.pinentryFlavor = "gtk2";

    # enable xserver but use startx instead of a DM
    services = {
      autorandr.enable = true;

      xserver = {
        enable = true;
        desktopManager.xterm.enable = false;
        displayManager.startx.enable = true;

        # install i3 plus supporting packages
        windowManager.i3 = {
          enable = true;
          # package = unstable.pkgs.i3;
          extraPackages = with pkgs; [
            dmenu
            i3status-rust
            i3lock
            termite
            xss-lock
            pavucontrol
            pamixer
            playerctl # control media
            brightnessctl # control screen backlight
            arandr
            flameshot

            # gtk themes
            arc-theme
            arc-icon-theme
          ];
        };
      };
    };

    environment.etc."xdg/gtk-3.0/settings.ini" = {
      text = ''
        [Settings]
        gtk-icon-theme-name=Arc
        gtk-theme-name=Arc-dark
        gtk-application-prefer-dark-theme = true
      '';
    };

    fonts.fonts = with pkgs; [ font-awesome ];
  };
}
