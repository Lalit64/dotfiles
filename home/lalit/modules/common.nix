{ ... }:
{
  imports = [
    ./home.nix # home-manager configuration

    # programs
    ./ghostty/ghostty.nix # terminal
    ./karabiner/karabiner.nix # keyboard utils
    ./lf/lf.nix # terminal file manager
    ./sketchybar/sketchybar.nix # top bar

    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    ./sioyek.nix # pdf viewer
    ./zed.nix # text editor
    ./cava.nix # audio visualizer
    ./vscode.nix # text editor
  ];
}
