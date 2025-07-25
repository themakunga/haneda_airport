{pkgs, lib, sops ? null}:
  let
    privateRepoConfig =
      if sops != null then
        let
          secrets = sops.secrets.github-token.yaml;
        in {
          owner = secrets.github.username;
          repo = "area51";
          rev = "main";
          sha256 = "0000000000000000000000000000000000000000000000000000";
          token = secrets.github.access_token;
        }
      else {
        owner = "themkunga";
        repo = "area51";
        rev = "main";
        sha256 = "0000000000000000000000000000000000000000000000000000";
      };

    privateRepo = pkgs.fetchFromGithub (privateRepoConfig // {
      netrcPhase = if privateRepoConfig ? token then ''
        cat > netrc <<EOF
        machine github.com
        login ${privateRepoConfig.owner}
        password ${privateRepoConfig.token}
        EOF
      '' else null;
    });
  in
    pkgs.mkShell {
      name = "dev-shell";

      buildInputs = with pkgs; [
        git
        gh
        delta
        neovim
        stow
        sops
        gnupg
        age
        ssh-to-age
      ] ++ (if sops != null then [ sops ] else []);

      shellHook = ''
        echo "Setting up development environment..."
        if [ ! -d "$HOME/.dotfiles" ]; then
          echo "Copying configuration from private repository..."
          p -r ${privateRepo} $HOME/.dotfiles
          chmod -R u+w $HOME/.dotfiles
        fi

        if [ -d "$HOME/.dotfiles" ]; then
          echo "Stowing configuration files..."
          stow -d $HOME/.dotfiles -t $HOME -S nvim -S git
        fi

        echo "Dev environment ready!"

        echo "configurando git"
        git config --global user.name = "Nicolas Martinez V"
        git config --glibal user.email = "nmartinezv@icloud.com"

        # configuracion adicional
        git config --global diff.colorMoved "default"
            git config --global init.defaultBranch "main"
            git config --global pull.rebase true
            git config --global push.default "simple"
      '';
    }
