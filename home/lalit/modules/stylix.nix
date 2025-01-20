{ pkgs, wallpaper, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = wallpaper;
    targets.kitty.enable = false;
    fonts = {
      monospace = {
        package = pkgs.lalit64-nur.monolisa-nf;
        name = "MonoLisa Nerd Font Mono";
      };
      sizes.terminal = 12.5;
    };
    opacity.terminal = 0.8;
  };
}
