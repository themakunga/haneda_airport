{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    go
    nodejs_24
    pnpm
    groovy
    ruby
    vim
    lazygit
    pre-commit
    zulu23
    dbeaver-bin
    libpq
    postgresql
    lazysql
    gh
    google-cloud-sdk
    awscli2
    pipx
    cyberduck
   zed-editor
  wezterm
    rustc
    cargo
  ];
}
