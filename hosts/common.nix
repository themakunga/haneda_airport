{config, pkgs, lib, inputs, ...}: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  environment = {
    variables = {
    };
    systemPackages = with pkgs; [
      dotnetCorePackages.sdk_8_0-bin
      dotnetCorePackages.runtime_8_0-bin
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
