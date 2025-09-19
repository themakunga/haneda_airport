{...}: {
  homebrew = {
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
    ];
    masApps = {
      "Magnet" = 441258766;
      "Amphetamine" = 937984704;
      "Xcode" = 497799835;
    };
  };
}
