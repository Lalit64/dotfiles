{
  config,
  ...
}:
{
  home.file.".config/ghostty/config".text = ''
    theme = catppuccin-mocha
    shell-integration = zsh
    font-family = "${config.stylix.fonts.monospace.name}"
    adjust-cell-height = 110%
    background-opacity = 0.85
    background-blur-radius = 64
    window-padding-x = 20
    window-padding-y = 20
    window-decoration = false
  '';
}
