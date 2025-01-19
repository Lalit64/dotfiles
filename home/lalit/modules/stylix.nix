{ pkgs, wallpaper, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = wallpaper;
    fonts = {
      monospace = {
        package = pkgs.lalit64-nur.monolisa-nf;
        name = "MonoLisa Nerd Font Mono";
      };
      sizes.terminal = 13;
    };
    opacity.terminal = 0.8;
  };
}
