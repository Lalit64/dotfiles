{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = "../dotfiles/wallpapers/nix-catppuccin-mocha.png";
    targets = {
      nixvim = {
        enable = false;
        plugin = "base16-nvim";
        transparentBackground.main = true;
        transparentBackground.signColumn = true;
      };
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font Mono";
      };
      sizes.terminal = 12.5;
    };
    opacity.terminal = 0.9;
  };
}
