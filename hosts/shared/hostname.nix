{config, lib, self, ...}:
with lib;

let
  cfg = config.hostname;
in {

  options.hostname = {
    enable = mkEnableOption "custom hostname";
    name = mkOption {
      type = types.str;
    };
  };


  config = mkIf cfg.enable {
    networking = {
      hostName = cfg.name;
    };
  };
}
