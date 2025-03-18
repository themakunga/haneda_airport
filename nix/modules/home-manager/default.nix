{
  config,
  pkgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.nicolas = {
      home = {
        stateVersion = "24.11";
        packages = with pkgs; [
          ripgrep
          fzf
          bat
        ];
      };
      programs = {
        git = {
          enable = true;
          userName = "Nicolas Martinez V";
          userEmail = "nmartinezv@icloud.com";
        };
      };
      fonts = {
        fontconfig = {
          enable = true;
        };
      };
    };
  };
}
