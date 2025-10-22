{ lib, stdenv, fetchFromGitHub, python3, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "instagram-cli";
  version = "unstable-2025-10-22";

  src = fetchFromGitHub {
    owner = "supreme-gg-gg";
    repo = "instagram-cli";
    rev = "main"; # puedes fijar un commit si querís
    sha256 = "sha256-p9HvOCzjOA+/gbjC6qEvyfnvZYmMptXuTI1l9QcC3WI="; # reemplázalo con el real al hacer nix-build
  };

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ python3 ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/* $out/
    chmod +x $out/instagram
    makeWrapper $out/instagram $out/bin/instagram-cli \
      --set PYTHONPATH "${python3.sitePackages}"
  '';

  meta = with lib; {
    description = "Instagram command line tool";
    homepage = "https://github.com/supreme-gg-gg/instagram-cli";
    license = licenses.mit;
    maintainers = [ maintainers.yourname or "nicolas" ];
    platforms = platforms.all;
  };
}

