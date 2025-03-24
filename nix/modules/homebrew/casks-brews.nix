{...}: {
  homebrew = {
    brews = [
      "nvm"
      "tfenv"
      "pnpm"
      "mas"
    ];
    casks = [
      "figma"
      "firefox@developer-edition"
      "firefox"
      "chromium"
      "google-chrome"
      "mattermost"
    ];
    masApps = {
      "Magnet" = 441258766;
      "Parcel" = 639968404;
      "Amphetamine" = 937984704;
      "BeFocusedPro" = 961632517;
      "Eero" = 1023499075;
      "Xcode" = 497799835;
    };
    onActivation = {
      cleanup = "zap";
    };
  };
}
