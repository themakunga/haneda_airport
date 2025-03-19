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
    ];
    masApps = {
      "Magnet" = 441258766;
    };
    onActivation = {
      cleanup = "zap";
    };
  };
}
