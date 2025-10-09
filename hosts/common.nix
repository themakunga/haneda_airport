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
      fzf
      bat

    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  imports = [
    ./shared/user.nix
    ./shared/hostname.nix
  ];
}
