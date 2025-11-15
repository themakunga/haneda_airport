{pkgs, ...}: {
  fonts = {
  packages = with pkgs;
    [
      noto-fonts
      noto-fonts-color-emoji
      fira-code
      fira-code-symbols
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
