{ ... }:
{
  imports = [
    ./home.nix # home-manager configuration

    # programs
    ./kitty/kitty.nix # terminal
    ./karabiner/karabiner.nix # hyper key
    ./lf/lf.nix
    ./sketchybar/sketchybar.nix # top bar

    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    ./zed.nix # text editor
    ./cava.nix # audio visualizer
    ./vscode.nix # text editor
    ./nvf.nix # nvim configuration
  ];
}
