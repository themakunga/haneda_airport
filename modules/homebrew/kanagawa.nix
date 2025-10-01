{...}:
{
  imports = [
    ./default.nix
  ];
  homebrew = {

    brews = [
      "tfenv"
      "mas"
    ];
    casks = [
      "figma"
      "zoom"
      "1password"
      "1password-cli"
      "firefox"
      "mural"
      "signal"
    ];
    masApps = {

    };
  };
}
