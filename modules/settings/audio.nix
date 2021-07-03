{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.settings.audio;
in
{
  options.settings.audio = {
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
      settings.pipewire.enable = true;
    })
    (mkIf (cfg.enable && cfg.daemon == "pulseaudio") {
      settings.pulseaudio.enable = true;
    })
  ];
}
