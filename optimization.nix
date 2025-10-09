{pkgs, ...}: {
  nix = {
    package = pkgs.nix;
    settings = {
      # Optimizar descargas
      download-buffer-size = "10485760"; # 10MB
      # Otras optimizaciones
      auto-optimise-store = true;
      max-jobs = "auto";
      cores = 0; # Usar todos los cores
      # Cache optimizado
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    # Configuración de GC
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    extraOptions = ''
      # Optimizaciones de rendimiento
      min-free = 536870912
      max-free = 1073741824
      fallback = true
      connect-timeout = 5
      # Evitar timeouts
      http-timeout = 30
      # Logs más verbosos para debugging
      log-lines = 50
    '';
  };

# Variables de entorno para .NET
  environment.systemPackages = with pkgs; [
    dotnet-sdk
    dotnet-runtime
    aspnetcore-runtime
  ];

  environment.variables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "0";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE = "1";
    DOTNET_NOLOGO = "1";
    DOTNET_RUNTIME_ID = "osx-arm64";
    # Optimización para macOS
    NIX_LDFLAGS = "-L${pkgs.openssl.out}/lib";
  };

# Activation script optimizado
  system.activationScripts.extraActivation.text = ''
    echo "🔧 Optimizando entorno Nix..."
  '';
}
