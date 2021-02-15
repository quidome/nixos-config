{ config, pkgs, ... }:

{

  # extra packages to support my i3 setup
  home.packages = with pkgs; [
    # audio/screen controls
    arandr
    brightnessctl
    pamixer
    pavucontrol
    playerctl

    # cli tools
    ranger
    feh

    # theming
    lxappearance
    arc-theme
    arc-icon-theme
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
