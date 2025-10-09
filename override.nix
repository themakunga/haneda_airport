{ pkgs, ... }:

{
  # Deshabilitar temporalmente paquetes problemáticos
  environment.systemPackages = with pkgs; [
    # Tus otros paquetes...
  ];

  # Remover .NET de la configuración temporalmente
  nixpkgs.config.packageOverrides = pkgs: {
    dotnet-sdk = null;
    dotnet-runtime = null;
    aspnetcore-runtime = null;
  };
}
