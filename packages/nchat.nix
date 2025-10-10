{ lib
, stdenv
, fetchFromGitHub
, ncurses
, pkg-config
, src
}:

stdenv.mkDerivation rec {
  pname = "nchat";
  version = "5.10.15"; # Revisa la versión actual en el repo

  inherit src;

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ ncurses ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp nchat $out/bin/
  '';

  meta = with lib; {
    description = "A chat client for Nostr written in C";
    homepage = "https://github.com/d99kris/nchat";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    platforms = platforms.unix;
    mainProgram = "nchat";
  };
}
