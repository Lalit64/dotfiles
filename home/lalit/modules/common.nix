{ ... }:
{
  imports = [
    ./home.nix # home-manager configuration

    # programs
    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    ./kitty/kitty.nix # terminal
    ./karabiner/karabiner.nix # keyboard shortcuts
    ./zed.nix # text editor
    ./cava.nix # audio visualizer
    ./vscode.nix # text editor
    ./nvf.nix # nvim configuration
    ./sketchybar.nix # top bar
  ];
}
