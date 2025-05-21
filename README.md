# Nix and Nix-Darwin settings

## Dependencies

### Install nix determinate

**Determinate Nix Installer** is a fast, friendly, and reliable way to install and manage [Nix] everywhere, including macOS, Linux, Windows Subsystem for Linux (WSL), SELinux, the Valve Steam Deck, and more.
It installs either [Nix](https://nixos.org) or [Determinate Nix](https://docs.determinate.systems/determinate-nix) (with [flakes] enabled by default), it offers support for seamlessly [uninstalling Nix](#uninstalling), it enables Nix to survive [macOS upgrades][macos-upgrades], and [much more](#features).

This one-liner is the quickest way to get started on any supported system:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

| Platform                                                             |    Multi user?    | `root` only |     Maturity      |
| -------------------------------------------------------------------- | :---------------: | :---------: | :---------------: |
| Linux (`x86_64` and `aarch64`)                                       | ✓ (via [systemd]) |      ✓      |      Stable       |
| MacOS (`x86_64` and `aarch64`)                                       |         ✓         |             | Stable (see note) |
| [Valve Steam Deck][steam-deck] (SteamOS)                             |         ✓         |             |      Stable       |
| [Windows Subsystem for Linux][wsl] 2 (WSL2) (`x86_64` and `aarch64`) | ✓ (via [systemd]) |      ✓      |      Stable       |
| [Podman] Linux containers                                            | ✓ (via [systemd]) |      ✓      |      Stable       |
| [Docker] containers                                                  |                   |      ✓      |      Stable       |




