{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    stow
  ];

  system.activationScripts = {
    setupDotfiles = ''
      if [ ! -d "${config.users.users.nicolas.home}/.nix/dotfiles" ]; then
        echo "Creating dotfiles directory..."
        mkdir -p "${config.users.users.nicolas.home}/.nix/dotfiles"
      fi
    '';
    stowDotfiles = ''
        echo "Symlinking dotfiles using stow..."
      if [ -d "${config.users.users.nicolas.home}/.nix/dotfiles" ]; then
        cd "${config.users.users.nicolas.home}/.nix/dotfiles"
        ${pkgs.stow}/bin/stow --verbose --target=${config.users.users.nicolas.home} */
      else
        echo "Dotfiles directory not found. Skipping stow."
      fi
    '';
  };
}
