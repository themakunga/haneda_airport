{config, pkgs, lib, inputs, ...}: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  environment = {
    variables = {
      DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE = "1";
      CORDEBUG_INVALID = "-1";
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
