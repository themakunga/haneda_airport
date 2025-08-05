{pkgs, lib, inputs, config, ...}: {
  imports = [
    (lib.mkIf (pkgs.stdenv.isDarwin) inputs.sops-nix.darwinModules.sops)
    (lib.mkIf (pkgs.stdenv.isLinux) inputs.sops-nix.nixosModules.sops)
  ];

  sops = {
    defaultSopsFile = ../secrets.yaml;
    validateSopsFile = false;

    age = {
      sshKeyPaths = ["~/.ssh"];
      keyFile = "~/.config/sops/age/keys.txt";
      genetateKey = true;
    };

    secrets = {
      default_password = {};
      github = {};
    }
  };
}
