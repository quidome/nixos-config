{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.my.audio;
in
{
  options.my.audio = {
    # configure audio
    enable = mkEnableOption "Enable audio";

    daemon = mkOption {
      type = with types; enum [ "pulseaudio" "pipewire" ];
      default = "pipewire";
      description = ''
        Which audio system to use, pulseaudio or pipewire (default).
      '';
      example = "pipewire";
    };
  };

  config = mkMerge [
    (mkIf (cfg.enable && cfg.daemon == "pipewire") {
      my.services.pipewire.enable = true;
    })
    (mkIf (cfg.enable && cfg.daemon == "pulseaudio") {
      my.hardware.pulseaudio.enable = true;
    })
  ];
}
