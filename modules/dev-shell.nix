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
          # access-token = secrets.github.access_token;
        }
      else {
        owner = "themkunga";
        repo = "area51";
        rev = "main";
        sha256 = "0000000000000000000000000000000000000000000000000000";
      };

    privateRepo = pkgs.fetchFromGitHub (privateRepoConfig // {
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
        lazygit
        neovim
        stow
        fzf
        sops
        gnupg
        age
        ssh-to-age
        self.packages.${system}.feedr
        self.packages.${system}.instagram-cli
      ] ++ (if sops != null then [ sops ] else []);

      OPENSSL_NO_VENDOR = "1";
      RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

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

        # configuracion base de github
        gh config set git_protocol ssh

        # archivos ignorados globalmente
        git config --global core.excludesfile ${pkgs.writeText "gitignore" ''
          .DS_Store
          _build/
          shell.nix
          .direnv/
          .envrc
          *.swp
        ''}

        # configuracion por workspace
        ## thoughtworks
        git config --global includeIf."gitdir:~/Projects/Thoughtworks/".path ${pkgs.writeText "gitconfig-thoughtworks" ''
        [user]
          name = Nicolas Villarroel
          email = nicolas.villarroel@thoughtworks.com
        ''}

        ## 42devs
        git config --global includeIf."gitdir:~/Projects/42devs/".path ${pkgs.writeText "gitconfig-42devs" ''
        [user]
          name = Nicolas Martinez V.
          email = nicolas@42devs.cl
        ''}

        ## bbook
        git config --global includeIf."gitdir:~/Projects/42devs/Clients/Bbook/".path ${pkgs.writeText "gitconfig-bbook" ''
        [user]
          name = Nicolas Martinez V.
          email = nmartinez@bbook.cl
      ''}

      # enable delta
      if command -v delta &> /dev/null; then
        git config --global core.pager "delta"
        git config --global interactive.diffFilter "delta --color-only"
        git config --global delta.navigate true
        git config --global delta.light false
      fi

      echo "Installed GIT Tools"
      echo "GIT: $(git --version)"
      echo "GH Cli: $(gh --version)"
      echo "LazyGit: $(lazygit --version)"

    '';
  }
