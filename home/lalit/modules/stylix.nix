{ pkgs, wallpaper, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = wallpaper;
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
      sizes.terminal = 13;
    };
    opacity.terminal = 0.8;
  };
}
