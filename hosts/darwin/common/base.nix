{config, lib, pkgs, self, ...}:
with lib;

let

  cfg = config.user;
in {



    nixpkgs = {
      hostPlatform = "aarch64-darwin";
      config = {
        allowUnfree = true;
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

    system = {
      primaryUser = cfg.name;
      stateVersion = 6;
      defaults = {
        dock = {
          autohide = true;
          minimize-to-application = true;
          show-recents = false;
          persistent-apps = [
            "/System/Applications/Launchpad.app/"
            "/System/Applications/Mail.app/"
            "/System/Applications/Calendar.app/"
            "/System/Applications/Notes.app/"
            "${pkgs.obsidian}/Applications/Nix Apps/Obsidian.app/"
            "/Applications/Safari.app/"
            "${pkgs.firefox}/Applications/Nix Apps/Firefox.app/"
            "${pkgs.google-chrome}/Applications/Nix Apps/Google Chrome.app/"
            "${pkgs.wezterm}/Applications/Nix Apps/WezTerm.app/"
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
        CustomUserPreferences = {
          NSGlobalDomain = {
            WebKitDeveloperExtras = true;
          };
          "com.apple.finder" = {
            ShowExternalHardDrivesOnDesktop = true;
            ShowHardDrivesOnDesktop = true;
            ShowMountedServersOnDesktop = true;
            ShowRemovableMediaOnDesktop = true;
            _FXSortFoldersFirst = true;
            FXDefaultSearchScope = "SCcf";
          };
          "com.apple.desktopservices" = {
            DSDontWriteNetworkStores = true;
            DSDontWriteUSBStores = true;
          };
        };
      };
      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

    };
}
