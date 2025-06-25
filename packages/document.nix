{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    obsidian
    typora
    pandoc
  ];
}
