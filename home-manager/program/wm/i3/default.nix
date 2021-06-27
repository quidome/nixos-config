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


    programs.i3status-rust = {
      enable = true;
      bars.top = {
        icons = "awesome";
        theme = "slick";
        blocks = [
          {
            block="load";
            interval = 5;
            format = "{5m}";
          }
          {
            block = "memory";
            format_mem = "{mem_used_percents}";
            warning_mem = 90.0;
            critical_mem = 95.0;
            interval = 5;
          }
          {
            block = "disk_space";
            warning = 10.0;
            alert = 5.0;
            format = "/ {available}";
          }
          {
            block = "docker";
            interval = 2;
            format = "{running}/{total}";
          }
          {
            block = "net";
            device = "wlp2s0";
            interval = 5;
            format = "{ssid} ({signal_strength})";
          }
          {
            block = "net";
            device = "enp0s31f6";
            format = "{bitrate}";
          }
          { block = "sound"; }
          {
            block = "battery";
            format = "{percentage} {time}";
          }
          {
            block = "time";
            interval = 60;
            timezone = "Europe/Amsterdam";
            format = "%a %d/%m %R W%W";
          }
          {
            block = "taskwarrior";
          }
        ];
      };
    };

    services.flameshot.enable = true;

    xdg.configFile."mimeapps.list".force = true;
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "org.pwmt.zathura.desktop";
        "image/jpeg" = "feh.desktop";
        "image/png" = "feh.desktop";
        "text/html" = "browser-chooser.desktop";
        "x-scheme-handler/about" = "browser-chooser.desktop";
        "x-scheme-handler/element" = "Electron.desktop";
        "x-scheme-handler/http" = "browser-chooser.desktop";
        "x-scheme-handler/https" = "browser-chooser.desktop";
        "x-scheme-handler/msteams" = "teams.desktop";
        "x-scheme-handler/sgnl" = "signal-desktop.desktop";
        "x-scheme-handler/signalcaptcha" = "signal-desktop.desktop";
        "x-scheme-handler/unknown" = "browser-chooser.desktop";
      };
    };
  };
}
