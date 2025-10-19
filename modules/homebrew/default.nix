{config, ...}: {
  homebrew = {
    global = {
      autoUpdate = true;
    };
    taps = builtins.attrNames config.nix-homebrew.taps;
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    brews = [
      "mas"
      "llvm" # WA- for #https://github.com/dotnet/runtime/issues/119706
    ];
    casks = [
      "typora"
      "mattermost"
      "firefox"
      "logitech-g-hub"
      "qmk-toolbox"
      "via"
      "google-chrome"
    ];
    masApps = {
      "Magnet" = 441258766;
      "Amphetamine" = 937984704;
      "Xcode" = 497799835;
      # "Parcel" = 375589283;
      # "Be Focused Pro" = 961632517;
    };
  };
}
