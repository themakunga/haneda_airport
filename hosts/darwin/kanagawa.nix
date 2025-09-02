{pkgs, self, ...}: {
  imports = [
    ../../packages/colima.nix
    ../../packages/browsers.nix
    ../../packages/development.nix
    ../../packages/document.nix
    ../../packages/fonts.nix
    ../../packages/games.nix
    ../../packages/social.nix
    ../../packages/terminal.nix
    ../../modules/homebrew/kanagawa.nix
    ./common/base.nix
  ];
}
