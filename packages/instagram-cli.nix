{
lib,
  buildPythonPackage,
fetchFromGitHub,
python3Packages,
}:

buildPythonPackage rec {
  pname = "instagram-cli";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "supreme-gg-gg";
    repo = "instagram-cli";
    rev = "main";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  propagatedBuildInputs = with python3Packages; [
    requests
    beautifulsoup4
    colorama
    pyfiglet
    inquirer
  ];

  postInstall = ''
    # Crear un script wrapper para ejecutar la aplicación
    mkdir -p $out/bin
    cat > $out/bin/instagram <<EOF
    #!${python3Packages.python.interpreter}
    import sys
    import os
    sys.path.insert(0, os.path.join("${placeholder "out"}", "${python3Packages.python.sitePackages}"))
    from instagram import main
    if __name__ == "__main__":
        main()
    EOF
    chmod +x $out/bin/instagram
  '';

  doCheck = false;

  meta = with lib; {
    description = "A command-line interface for Instagram";
    homepage = "https://github.com/supreme-gg-gg/instagram-cli";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
