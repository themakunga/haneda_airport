{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage rec {
  pname = "feedr";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "bahdotsh";
    repo = pname;
    rev = "main";
    hash = "sha256-GYrIOONJA7x0M/muAJ7Ui8VsItXFycvdWwo7pABrnmU=";
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
    description = "A fast and minimal RSS feed reader";
    homepage = "https://github.com/bahdotsh/feedr";
    license = with licenses; [mit];
    maintainers = with maintainers; [];
    platforms = platforms.all;
  };
}
