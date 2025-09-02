{pkgs, self, ...}: {
  imports = [
    ../../packages/colima.nix
    ../../packages/browsers.nix
    ../../packages/development.nix
    ../../packages/document.nix
    ../../packages/fonts.nix
    ../../packages/social.nix
    ../../packages/terminal.nix
    ./common/base.nix
    ../../modules/homebrew/outer-heaven.nix
  ];

  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "${pkgs.zed-editor}/Applications/Nix Apps/Zed.app/"
            "${pkgs.google-chrome}/Applications/Nix Apps/Google Chrome.app/"
          "/Applications/zoom.us.app/"
        ];
      };
    };
  };

}
