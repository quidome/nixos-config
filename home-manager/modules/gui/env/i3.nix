{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.settings.gui;
in
{
  config = mkIf (cfg.environment == "i3") {
    # Configuration shared between all xorg enabled configs
    settings.xorg.enable = true;

    # setup programs related to my i3 setup
    programs = {
      termite = {
        enable = true;

        allowBold = true;
        audibleBell = false;
        clickableUrl = true;
        cursorBlink = "system";
        cursorShape = "block";
        dynamicTitle = true;
        filterUnmatchedUrls = true;
        font = "Source Code Pro Medium 10";
        mouseAutohide = false;
        scrollOnKeystroke = true;
        scrollOnOutput = false;
        scrollbackLines = 10000;
        scrollbar = "off";
        searchWrap = true;
        urgentOnBell = true;

        colorsExtra = ''
            color0  = #403e41
            color8  = #727072
            color1  = #ff6188
            color9  = #ff6188
            color2  = #a9dc76
            color10 = #a9dc76
            color3  = #ffd866
            color11 = #ffd866
            color4  = #fc9867
            color12 = #fc9867
            color5  = #ab9df2
            color13 = #ab9df2
            color6  = #78dce8
            color14 = #78dce8
            color7  = #fcfcfa
            color15 = #fcfcfa
        '';
      };

      # extra packages to support my i3 setup
      i3status-rust = {
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
    };

    # set mimeapps to use when running i3
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
