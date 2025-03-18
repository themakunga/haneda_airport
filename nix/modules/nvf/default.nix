{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        additionalRuntimeDirectory = [
          # ../../dotfiles/.config/nvim
        ];
      };
    };
  };
}
