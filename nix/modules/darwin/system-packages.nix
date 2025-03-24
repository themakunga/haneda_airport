{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alacritty
    neofetch
    nchat
    tmux
    mkalias
    obsidian
    neovim
    oh-my-posh
    go
    nodejs_23
    groovy
    ruby
    bash
    vim
    lazygit
    ripgrep
    matterhorn
    pre-commit
    zulu23
  ];

  fonts = {
    packages = with pkgs;
      [
        noto-fonts
        noto-fonts-emoji
        fira-code
        fira-code-symbols
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
