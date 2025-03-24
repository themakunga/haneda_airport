{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    stow
  ];

  system.activationScripts = {
    dotfiles.text = (builtins.readFile ../../scripts/dotfiles.sh);
  };
}
