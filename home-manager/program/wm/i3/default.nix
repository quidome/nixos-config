{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.elemental.program.wm.i3;
in
{
  options.elemental.program.wm.i3 = {
    enable = mkEnableOption "Enable i3 configuration";
  };

  config = mkIf cfg.enable {
    # extra packages to support my i3 setup
    home.packages = with pkgs; [
      # theming
      arc-theme
      arc-icon-theme
    ];

    xdg.configFile."mimeapps.list".force = true;
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "org.pwmt.zathura.desktop";
        "image/jpeg" = "feh.desktop";
        "image/png" = "feh.desktop";
        "text/html" = "browser.desktop";
        "x-scheme-handler/about" = "browser.desktop";
        "x-scheme-handler/element" = "Electron.desktop";
        "x-scheme-handler/http" = "browser.desktop";
        "x-scheme-handler/https" = "browser.desktop";
        "x-scheme-handler/msteams" = "teams.desktop";
        "x-scheme-handler/sgnl" = "signal-desktop.desktop";
        "x-scheme-handler/signalcaptcha" = "signal-desktop.desktop";
        "x-scheme-handler/unknown" = "browser.desktop";
      };
    };
  };
}
