{...}: {
  homebrew.enable = true;
  homebrew.onActivation.cleanup = "zap";

  imports = [./casks-brews.nix];
}
