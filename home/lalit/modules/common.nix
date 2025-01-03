{ ... }:
{
  imports = [
    ./home.nix # home-manager configuration

    # programs
    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    ./kitty/kitty.nix # terminal
    ./karabiner/karabiner.nix
    ./ghostty.nix
    ./zed.nix # text editor
    ./cava.nix
    ./vscode.nix # secondary text editor
    ./simplebar.nix # bar
    ./nixvim.nix # Neovim config
  ];
}
