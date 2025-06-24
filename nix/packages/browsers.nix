{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    firefox-devedition
    google-chrome
  ];
}
