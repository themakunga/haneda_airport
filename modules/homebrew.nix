{homebrew, ...}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [
      "nvm"
      "tfenv"
      "mas"
    ];
    casks = [
      "figma"
      "typora"
      "mattermost"
      "zoom"
      "1password"
      "1password-cli"
      "teamviewer"
    ];
    masApps = {
      "Magnet" = 441258766;
      "Parcel" = 639968404;
      "Amphetamine" = 937984704;
      "BeFocusedPro" = 961632517;
      "Xcode" = 497799835;
    };
  };
}
