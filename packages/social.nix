{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    halloy
    slack
    discord
    irssi
    reddit-tui
    neomutt
    nchat
  ];
}
