{...}: {
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "themakunga.cachix.org-1:6G4uSeEclXBILBnmlbDsTAapL2vE0ndx4laL02AzzR0="
    ];
  };
}
