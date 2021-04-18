{ config, pkgs, ... }:

let
  user = "qmeijer";
  userHome = "/home/${user}";
  hostname = "linux-10194";
in {
  imports = [
    ./secret.nix
    ../../elemental.nix
    ../../modules/basics.nix
    ../../modules/vim
    ../../modules/gui.nix
    ../../program
    ../../user
  ];

  # home manager required settings
  home.username = user;
  home.homeDirectory = userHome;
  home.stateVersion = "20.09";

  # elemental setup
  elemental.user = user;
  elemental.role = "workstation";
  elemental.host = hostname;

  # feature toggles
  elemental.program.terminal.tmux.enable = true;
  elemental.program.de.gnome.enable = true;
  #elemental.program.wm.i3.enable = false;

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    file binutils-unwrapped # needed for ruby gems
    ruby_2_5 bundler rubyPackages_2_5.rake
    gems_2_5.puppet5 gems_2_5.pdk
  ];
}
