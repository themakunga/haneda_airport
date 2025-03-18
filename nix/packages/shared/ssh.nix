{
  config,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [22];

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  environment.systemPackages = with pkgs; [
    openssh
  ];
}
