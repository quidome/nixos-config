{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.my.services.gpg-agent;
in
{
  options.my.services.gpg-agent = {
    enable = mkEnableOption {
      description = "Enable gpg-agent";
      default = true;
    };
    enableSshSupport = mkEnableOption {
      description = "Enable ssh support to gpg-agent";
      default = true;
    };
  };

  config = mkIf cfg.enable {
    services = {
      gpg-agent = {
        enable = true;
        enableSshSupport = cfg.enableSshSupport;
        defaultCacheTtl = 86400;
        maxCacheTtl = 86400;
        maxCacheTtlSsh = 86400;
        defaultCacheTtlSsh = 86400;
      };
    };
  };
}
