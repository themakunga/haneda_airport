{config, ...}: {
  homebrew = {
    taps = builtins.attrNames config.nix-homebrew.taps;
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    brews = [
      "mas"
    ];
    casks = [
      "typora"
      "mattermost"
      "firefox"
      "logitech-g-hub"
      "qmk-toolbox"
    ];
    masApps = {
      "Magnet" = 441258766;
      "Amphetamine" = 937984704;
      "Xcode" = 497799835;
      "Parcel" = 375589283;
    };
  };
}
