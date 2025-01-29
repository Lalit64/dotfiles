{ ... }:
{
  imports = [
    ./home.nix # home-manager configuration

    # programs
    ./kitty/kitty.nix # terminal
    ./karabiner/karabiner.nix # hyper key
    # ./nixvim/nixvim.nix # neovim configuration
    ./lf/lf.nix
    ./sketchybar/sketchybar.nix # top bar
    ./sioyek/sioyek.nix

    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    # ./nvf.nix
    ./nvchad.nix
    ./zed.nix # text editor
    ./cava.nix # audio visualizer
    ./vscode.nix # text editor
  ];
}
