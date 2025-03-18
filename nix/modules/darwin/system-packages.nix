{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alacritty
    neofetch
    tmux
    mkalias
    obsidian
    wezterm
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
