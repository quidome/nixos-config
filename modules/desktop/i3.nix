{ config, pkgs, lib, ... }:

with lib;

# let
#   unstable = import
#     (builtins.fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz)
#     # reuse the current configuration
#     { config = config.nixpkgs.config; };
# in
{
  config = mkIf (config.custom.desktop == "i3") {
    # i3 related hardware configuration
    programs = {
      gnupg.agent.pinentryFlavor = "gtk2";

      dconf.enable = true;
    };

    # enable xserver but use startx instead of a DM
    services = {
      autorandr.enable = true;

      xserver = {
        desktopManager.xterm.enable = false;
        displayManager.startx.enable = true;

        # install i3 plus supporting packages
        windowManager.i3 = {
          enable = true;
          # package = unstable.pkgs.i3;
          extraPackages = with pkgs; [
            # i3 supporting apps
            dmenu
            i3status-rust
            i3lock
            termite
            xss-lock
            dunst

            # audio/screen controls
            arandr
            brightnessctl
            pamixer
            playerctl

            # cli tools
            ranger
            feh

            # theming
            lxappearance
            adapta-backgrounds
            adapta-gtk-theme
            arc-icon-theme
            arc-theme
            gruvbox-dark-gtk
            gruvbox-dark-icons-gtk
            numix-gtk-theme
            numix-icon-theme
          ];
        };
      };
    };

    fonts.fonts = with pkgs; [ font-awesome ];
  };
}
