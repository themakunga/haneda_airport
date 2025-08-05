{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nmap
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
  ];
}
