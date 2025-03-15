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
      font-size = 16;
      cursor-style = "underline";
      adjust-cell-height = "50%";
      macos-titlebar-style = "hidden";
      macos-window-shadow = false;
      window-inherit-working-directory = false;
      window-padding-balance = true;
      window-padding-x = 15;
      window-padding-y = 15;
    };
  };
}
