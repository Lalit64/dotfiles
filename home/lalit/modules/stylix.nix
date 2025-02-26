{
  inputs,
  system,
  pkgs,
  wallpaper,
  ...
}:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = wallpaper;
    targets = {
      kitty.enable = false;
      bat.enable = false;
      zed.enable = false;
    };
    fonts = {
      monospace = {
        package = inputs.lalit64-nur.packages."${system}".operator-nf;
        name = "CaskaydiaCove Nerd Font Mono";
      };
      sizes.terminal = 13;
    };
    opacity.terminal = 0.8;
  };
}
