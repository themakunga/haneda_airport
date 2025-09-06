{...}: {
  imports = [
    ../../packages/colima.nix
    ../../packages/browsers.nix
    ../../packages/development.nix
    ../../packages/document.nix
    ../../packages/fonts.nix
    ../../packages/social.nix
    ../../packages/terminal.nix
    ./common/base.nix
  ];

  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/Applications/Nix Apps/Zed.app"
          "/Applications/Nix Apps/WezTerm.app"
          "/Applications/Nix Apps/Google Chrome.app"
          "/Applications/zoom.us.app/"
        ];
      };
    };
  };

}

