{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    ranger
    feh
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "browser.desktop";
      "x-scheme-handler/http" = "browser.desktop";
      "x-scheme-handler/https" = "browser.desktop";
      "x-scheme-handler/about" = "browser.desktop";
      "x-scheme-handler/unknown" = "browser.desktop";
      "x-scheme-handler/msteams" = "teams.desktop";
      "x-scheme-handler/element" = "Electron.desktop";
      "x-scheme-handler/sgnl" = "signal-desktop.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
