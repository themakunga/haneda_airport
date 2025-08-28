{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "feedr";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "bahdotsh";
    repo = pname;
    rev = "main";
    hash = "1ry4wa4krm1c4ky4y5j67bfrphxqhr3ggcc7qyby3srgacc957l7";

  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  nativeBuildInputs = [
    pkg-config;
  ];

  buildInputs = [
    openssl
  ] ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.Security
      darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  OPENSSL_NO_VENDOR = 1;

  meta = with lib {
    description = "A fast and minimal RSS feed reader";
    homepage = "https://github.com/bahdotsh/feedr";
    license = with licenses; [mit];
    maintainers = with maintainers; [];
    platforms = platforms.all;
  };
}
