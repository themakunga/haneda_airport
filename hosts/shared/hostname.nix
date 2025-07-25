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
    system = {
      defaults = {
        ComputerName = cfg.name;
        LocalHostName = cfg.name;
        hostname = cfg.name;
      };
    };
  };
}
