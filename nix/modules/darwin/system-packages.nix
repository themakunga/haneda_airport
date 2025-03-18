{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neofetch
    tmux
    mkalias
    obsidian
    wezterm
    neovim
    oh-my-posh
    go
    nodejs_23
    lazygit
  ];

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      fira-code
      fira-code-symbols
      nerd-fonts.hack
    ];
  };
}
