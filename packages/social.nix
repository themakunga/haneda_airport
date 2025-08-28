{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nchat
    halloy
    slack
    discord
    irssi
    reddit-tui
  ];
}
