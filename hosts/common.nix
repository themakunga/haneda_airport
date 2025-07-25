{config, pkgs, lib, inputs, ...}: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      htop
      ctop
    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  imports = [
    ./shared/git.nix
    ./shared/user.nix
    ./shared/hostname.nix
  ];
}
