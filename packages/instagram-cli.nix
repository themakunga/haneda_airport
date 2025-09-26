{
  lib,
  stdenv,
  fetchFromGitHub,
  python3,
  makeWrapper,
}:

let pythonEnv = python3.withPackages (ps: with ps; [
    request
    beautifulsoup4
    pillow
    pyfiglet
    rich
    numpy
    cryptography
    pyperclip
    pygments
    setuptools
  ]);

in stdenv.mkDerivation rec {
    pname = "instagram-cli";
    version = "1.4.1";

    src = fetchFromGitHub {
      owner = "supreme-gg-gg";
      repo = "instagram-cli";
      rev = "main";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    };

    nativeBuildInputs = [makeWrapper];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/lib/${pname}

      cp -r . $out/lib/${pname}

      cat > $out/bin/instagram <<EOF
      #!${stdenv.shell}
      export PYTHONPATH="$out/lib/${pname}:\$PYTHONPATH"
      exec ${pythonEnv}/bin/python -m instagram_cli "\$@"
      EOF

      chmod +x $out/bin/instagram

      runHook postInstall
    '';

    meta = {
      description = "Instagram CLI ";
      homepage = "https://github.com/supreme-gg-gg/instagram-cli";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [  ];
      platforms = lib.platforms.all;
      mainProgram = "instagram";
    };
  }
