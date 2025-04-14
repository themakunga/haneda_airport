{pkgs, ...}: {
  security = {
    pam = {
      services= {
        sudo_local= {
        touchIdAuth = true;
      };
      };
    };


  };
  system = {
    defaults = {
      dock.autohide = true;
      dock.persistent-apps = [
        "/System/Applications/Launchpad.app"
        "/System/Applications/Mail.app"
        "/System/Applications/Calendar.app"
      ];
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

    stateVersion = 6;
  };
}
