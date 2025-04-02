{ pkgs, config, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.emptyDirectory;
    enableZshIntegration = true;

    settings = {
      shell-integration = "zsh";
      shell-integration-features = "no-cursor";
      background-opacity = 0.8;
      background-blur = 64;
      font-family = config.stylix.fonts.monospace.name;
      font-size = 18;
      font-thicken = true;
      cursor-style = "underline";
      window-colorspace = "display-p3";
      adjust-cell-height = "40%";
      macos-titlebar-style = "hidden";
      macos-window-shadow = false;
      macos-option-as-alt = "left";
      window-inherit-working-directory = false;
      window-padding-balance = true;
      window-padding-x = 15;
      window-padding-y = 15;
    };
  };
}
