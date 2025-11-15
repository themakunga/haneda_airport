{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nmap
    fd
    neofetch
    tmux
    oh-my-posh
    bash
    ripgrep
    sops
    age
    ssh-to-age
    fzf
    stow
    glab
    qmk
    btop
    dott-tui
  ];
}
