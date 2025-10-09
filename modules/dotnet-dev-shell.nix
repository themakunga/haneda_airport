{pkgs, nixpkgsConfig, overlays, nixpkgs, system, ...}:
let
  pkgs = import nixpkgs {
    inherit system;
    overlays = overlays;
    config = nixpkgsConfig;
  };
in pkgs.mkShell {
  name = "dotenv-dev-shell";
  nativeBuildInputs = with pkgs; [
    dotnet-sdk
    pkg-config
    openssl
    zlib
    icu
    curl
  ];

  DOTNET_ROOT = "${pkgs.dotnet-sdk}";
  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "0";
  DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  DOTNET_SKIP_FIRST_TIME_EXPERIENCE = "1";
  DOTNET_NOLOGO = "1";
  DOTNET_RUNTIME_ID = if system == "aarch64-darwin" then "osx-arm64" else "linux-x64";

  shellHook = ''
    echo "🔧 .NET SDK Precompilado"
    echo "Version: $(dotnet --version)"
    echo "Runtime: $DOTNET_RUNTIME_ID"
  '';
}
