{ ... }:
{
  imports = [
    ./home.nix # home-manager configuration

    # programs
    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    ./kitty.nix # terminal
    ./ghostty.nix
    ./zed.nix # text editor
    ./cava.nix
    ./vscode.nix # secondary text editor
    ./simplebar.nix # bar
    # ./sketchybar/sketchybar.nix
    ./nixvim.nix # Neovim config
  ];
}
