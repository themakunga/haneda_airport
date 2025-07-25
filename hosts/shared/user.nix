{config, lib, pkgs, ...}:
with lib;

let
  cfg = config.user;
in {
  options.user = {
    enable = mkEnableOption "custom user";
    name = mkOption {
      type = types.str;
      default = "nicolas";
    };
    decription = mkOption {
      type = types.str;
      default = "Nicolas Martinez";
    };
    shell = mkOption {
      type = types.str;
      default = "zsh";
    };
    extraGroups = mkOption {
      type = types.listOf types.str;
      default = [];
    };
  };

  config = mkIf cfg.enable {
    users.users.${cfg.name} = {
      description = cfg.description;
      home = "${ if pkgs.stdenvNoCC.isDarwin then "/Users" else "/home"}/${cfg.name}";
      shell = pkgs.${cfg.shell};
      extraGroups = cfg.extraGroups;
    };
  };
}
