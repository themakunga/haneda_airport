{pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    stow
  ];

  shellHook = ''
    if [ -d "~/.secrets-repo/" ]; then
      echo "the repo exists pulling last changes"
      cd ~/.secrets-repo/
      git pull origin main
    else
      echo "Cloning repository"
      git clone git@github.com:themakunga/secrets.git ~/.secrets-repo
      cd ~/.secrets-repo
    fi

    if [ -d "." ]; then
      echo "the repo is ready"
      stow -v -t ~ .
    else
      echo "Error: Could not access the repository directory."
      exit 1
    fi
  '';
}
