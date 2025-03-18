{...}: {
  programs.zsh.enable = true;

  users.users.nicolas = {
    name = "nicolas";
    home = "/Users/nicolas";
  };
}
