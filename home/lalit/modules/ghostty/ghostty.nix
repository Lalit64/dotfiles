{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.emptyDirectory;
    enableZshIntegration = true;

    settings = {
      shell-integration = "zsh";
      shell-integration-features = "no-cursor";
      background-blur = 255;
      theme = "tokyonight_moon";
      font-thicken = true;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      window-colorspace = "display-p3";
      adjust-cell-height = "30%";
      macos-titlebar-style = "hidden";
      macos-window-shadow = true;
      macos-option-as-alt = "left";
      window-inherit-working-directory = false;
      window-padding-balance = true;
      window-padding-x = 15;
      window-padding-y = 15;
      # Quick Terminal
      keybind = "global:cmd+grave_accent=toggle_quick_terminal";
      quick-terminal-position = "right";
    };
  };
}
