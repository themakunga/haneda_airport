{config, lib, pkgs, self, ...}:
with lib;

let

  cfg = config.user;
in {

    lib = {
      generators = {
        toPlist = {
          escape = true;
        };
      };
    };

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
            {
              app = "/System/Applications/Apps.app";
            }
            {
              app = "/System/Applications/Mail.app";
            }
            {
              app = "/System/Applications/Calendar.app";
            }
            {
              app = "/Applications/Safari.app";
            }
            {
              app = "/System/Applications/Notes.app";
            }
            {
              spacer = {
                small = true;
              };
            }
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
        screencapture = {
          disable-shadow = true;
          include-date = true;
          show-thumbnail = true;
          location = "/Users/${cfg.name}/Media/Screen Capture/";
          target = "preview";

        };
      };
      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

    };
}
