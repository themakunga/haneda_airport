{pkgs, self, ...}: {
  imports = [
    ../../packages/colima.nix
    ../../packages/browsers.nix
    ../../packages/development.nix
    ../../packages/document.nix
    ../../packages/fonts.nix
    ../../packages/social.nix
    ../../packages/terminal.nix
  ];

  system = {
    stateVersion = 6;
    defaults = {
      dock = {
        autohide = true;
        minimize-to-application = true;
        show-recents = false;
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Calendar.app"
          "${pkgs.firefox}/Applications/Nix Apps/Firefox.app/"
          "${pkgs.google-chrome}/Applications/Nix Apps/Google Chrome.app/"
          "${pkgs.obsidian}/Applications/Nix Apps/Obsidian.app/"
          "/System/Applications/Notes.app/"
          "${pkgs.alacritty}/Applications/Nix Apps/Alacritty.app/"
          "${pkgs.zed}/Applications/Nix Apps/Zed.app/"

        ];
      };
      finder = {
        FXPreferredViewStyle = "clmv";
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };
  nix = {
    enable = true;
    settings = {
      experimental-features = "nix-command flakes";
    };
  };

  security = {
    pam = {
      services = {
        sudo_local = {
          touchIdAuth = true;
        };
      };
    };
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      _1password-gui
      _1password-cli
    ];
  };
}
