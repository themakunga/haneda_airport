{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nchat
    mattermost
    matterhorn
    halloy
    slack
    discord
  ];
}
