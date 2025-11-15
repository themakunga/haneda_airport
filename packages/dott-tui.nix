{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage rec {
  pname = "dott";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "commended";
    repo = pname;
    rev = "main";
    hash = "sha256-tPxX1vMnIFakcjZ4uoAHyxB0f4LVCtIe+AJ9s7zTGeg=";
  };
  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  OPENSSL_NO_VENDOR = 1;

  meta = with lib; {
    description = "a beautiful and fast tui written in rust";
    homepage = "https://github.com/commended/dott";
    license = with licenses; [mit];
    maintainers = with maintainers; [];
    platforms = platforms.all;
  };
}

