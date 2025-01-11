{ ... }:
{
  imports = [
    ./home.nix # home-manager configuration

    # programs
    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    ./kitty/kitty.nix # primary terminal
    ./karabiner/karabiner.nix # keyboard shortcuts
    ./zed.nix # secondary text editor
    ./cava.nix # audio visualizer
    ./vscode.nix # primary text editor
    ./nvf.nix # nvim configuration
    ./fzf.nix # fzf
    ./sketchybar.nix
  ];
}
