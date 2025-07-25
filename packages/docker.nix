{pkgs, lib, config, ...}: {
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];
}
