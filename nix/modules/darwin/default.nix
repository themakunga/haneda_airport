{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./system-packages.nix
    ./system-settings.nix
    ./user-configuration.nix
    # ../../packages/shared/ssh.nix
    ./colima-docker.nix
  ];

  nix.enable = false;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";

  system = {
    # configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 6;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}
