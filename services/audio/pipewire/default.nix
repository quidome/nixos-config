{ config, pkgs, lib, ... }:
with lib;
let
  unstable = import <unstable> {};
in {
    imports = [
      # import the unstable nix expression for the pipewire services
      <unstable/nixos/modules/services/desktops/pipewire/pipewire.nix>
      <unstable/nixos/modules/services/desktops/pipewire/pipewire-media-session.nix>
    ];

    # setup pipewire for audio
    # disable the default (20.09) nix expression for the pipewire service
    disabledModules = [ "services/desktops/pipewire.nix" ];

    sound.enable = true;
    nixpkgs.config.pulseaudio = true;
    security.rtkit.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      package = unstable.pipewire;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = false;
    };

    services.pipewire.media-session = {
      package = unstable.pipewire.mediaSession;
    };
}
