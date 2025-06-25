{inputs, config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    docker
    colima
    docker-client
    docker-compose
  ];







  launchd.daemons.docker-socket = lib.mkIf pkgs.stdenv.isDarwin {
    serviceConfig = {
      ProgramArguments = [
        "/bin/sh" "-c"
        "/bin/wait4path /run/docker.sock && /bin/chmod a+rw /run/docker.sock"
      ];
      RunAtLoad = true;
      StandardErrorPath = "/tmp/docker-socket.err";
      StandardOutPath = "/tmp/docker-socket.out";
    };
  };

  launchd.user.agents.colima = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.colima}/bin/colima"
        "start"
        "--vm-type=qemu"
        "--mount-type=9p"
        "--cpu=4"
        "--memory=8"
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardErrorPath = "/tmp/colima.err";
      StandardOutPath = "/tmp/colima.out";
    };
  };

  environment.shellInit = ''
    export DOCKER_HOST="unix:///Users/${config.users.primaryUser.username}/.colima/default/docker.sock"
  '';
}
