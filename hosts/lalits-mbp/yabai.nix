{ ... }:
{
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";

      top_padding = 20;
      bottom_padding = 14;
      left_padding = 14;
      right_padding = 14;
      window_gap = 14;

      mouse_follows_focus = "off";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouser_action2 = "resize";
      mouse_drop_action = "swap";

      split_ratio = 0.5;
      auto_balance = "off";
    };
    extraConfig = ''
      yabai -m space 1 --label web
      yabai -m space 2 --label dev
      yabai -m space 3 --label chat
      yabai -m space 4 --label sys
      yabai -m space 5 --label V
      yabai -m space 6 --label VI
      yabai -m space 7 --label VII
      yabai -m space 8 --label VIII
      yabai -m space 9 --label IX
      yabai -m space 10 --label X

      yabai -m config window_opacity off

      # rules for specific apps
      yabai -m rule --add app="^System Settings$" manage=off
      yabai -m rule --add app="^Finder$" manage=off
      yabai -m rule --add app="^kitty$" manage=on
      yabai -m rule --add app="^java$" manage=on
      yabai -m rule --add app="^Stickies$" manage=off

      sudo yabai --load-sa
    '';
  };
}
