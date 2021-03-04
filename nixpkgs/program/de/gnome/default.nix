{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.elemental.home.program.de.gnome;
  user = config.home.username;
  userHome = config.home.homeDirectory;
in
{
  options.elemental.home.program.de.gnome = {
    enable = mkEnableOption "Enable gnome configuration";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # gnome extensions
      gnomeExtensions.dash-to-dock
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.emoji-selector
      gjs
    ];
    # gnome settings by dconf
    dconf.settings = {
      "apps/guake/general" = {
        gtk-prefer-dark-theme = true;
        gtk-theme-name = "Arc-Dark";
        use-scrollbar = false;
        use-trayicon = false;
        window-tabbar = false;
        window-width = 80;
      };
      "apps/guake/style/background" = {
        transparency = 90;
      };
      "org/gnome/mutter" = {
        workspaces-only-on-primary = false;
      };
      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };
      "org/home/${user}/bin/browser/gnome/desktop/background" = {
        picture-uri = "file:///${userHome}/Pictures/wallpapers/starry-night.jpg";
      };
      "org/gnome/desktop/calendar" = {
        show-weekdate = true;
      };
      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
        enable-hot-corners = false;
        show-battery-percentage = true;
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        natural-scroll = false;
        two-finger-scrolling-enabled = true;
      };
      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "sloppy";
      };
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "gnome-terminal";
        name = "launch terminal";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Shift><Super>b";
        command = "${userHome}/bin/browser";
        name = "launch browserchooser";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        binding="<Shift><Super>p";
        command="/home/${user}/bin/rofipass";
        name="launch rofipass";
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        animate-show-apps = false;
        hot-keys = false;
        isolate-workspaces = true;
        require-pressure-to-show = false;
        show-favorites = true;
        show-show-apps-button = true;
        show-trash = false;
      };
      "org/gnome/shell/extensions/screenshot" = {
        clipboard-action = "set-image-data";
        enable-indicator = true;
        enable-notification = true;
        filename-template = "{Y}{m}{d}{H}{M}{S}-{w}x{h}";
        imgur-enable-notification = true;
        save-location = "${userHome}/Pictures/screenshots";
        save-screenshot = true;
        shortcut-select-area = ["Print"];
      };
    };
  };
}
