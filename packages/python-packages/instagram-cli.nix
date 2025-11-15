{ lib, fetchFromGitHub, python3Packages, pkgs }:

python3Packages.buildPythonApplication rec {
  pname = "instagram-cli";
  version = "unstable-2025-10-22";

  src = fetchFromGitHub {
    owner = "supreme-gg-gg";
    repo = "instagram-cli";
    rev = "main";
    sha256 = "sha256-p9HvOCzjOA+/gbjC6qEvyfnvZYmMptXuTI1l9QcC3WI="; # reemplázalo con el hash real
  };

  # si el proyecto no tiene setup.py / pyproject.toml:
  format = "other";

installPhase = ''
  mkdir -p $out/bin
  cp -r $src $out/
  cat > $out/bin/instagram-cli <<EOF
#!${pkgs.bash}/bin/bash
exec ${python3Packages.python.interpreter} -m instagram-cli "\$@"
EOF
  chmod +x $out/bin/instagram-cli
  '';
  meta = with lib; {
    description = "Instagram command line tool";
    homepage = "https://github.com/supreme-gg-gg/instagram-cli";
    license = licenses.mit;
    maintainers = [ maintainers.yourname or "nicolas" ];
    platforms = platforms.all;
  };
}

