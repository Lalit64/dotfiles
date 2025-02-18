{
  pkgs,
  config,
  username,
  ...
}:
{
  # custom tab bar
  home.file = {
    "/Users/${username}/.config/kitty/tab_bar.py".source = ./tab_bar.py;
    "/Users/${username}/.config/kitty/search.py".source = ./search.py;
    "/Users/${username}/.config/kitty/scroll_mark.py".source = ./scroll_mark.py;
  };
  programs.kitty = {
    enable = true;
    package = pkgs.emptyDirectory;

    settings = {
      # customization stuff
      background_opacity = 0.9;
      background_blur = 64;
      window_padding_width = 20;
      hide_window_decorations = "titlebar-only";

      allow_remote_control = true;
      confirm_os_window_close = 0;

      cursor_shape = "underline";
      cursor_trail = 4;

      tab_bar_style = "custom";
      tab_bar_edge = "top";
      tab_bar_align = "left";
      tab_powerline_style = "slanted";
      active_tab_font_style = "normal";

      # font
      font_family = config.stylix.fonts.monospace.name;
      font_size = config.stylix.fonts.sizes.terminal + 4;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };

    keybindings = {
      # switch tabs
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+," =
        "launch --type=overlay /etc/profiles/per-user/${username}/bin/nvim ~/.config/snowflake/home/${username}/modules/kitty/kitty.nix";

      # search using cmd+f
      "cmd+f" =
        "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
    };

    shellIntegration = {
      mode = "no-cursor";
      enableZshIntegration = true;
    };

    extraConfig = ''
      ### remap kitty to use ⌥ and ⌘:
      map cmd+v paste_from_clipboard
      ## jump to end of line:
      map super+right send_text all \x05
      ## jump to start of line:
      map super+left send_text all \x01
      ## jump right to end of word:
      map alt+right send_text all \x1b\x66
      ## jump left to beginning of word:
      map alt+left send_text all \x1b\x62
      ## delete line from cursor position to start of line:
      map super+backspace send_text all \x15
      ## delete word works by default via opt+backspace
      ## undo (doesn't work in zsh, works in nushell with ctrl-z and ⌘-z in both):
      map super+z send_text all \x1A

      modify_font cell_height 15px
      nnoremap <ScrollWheelRight> <Nop>
      nnoremap <ScrollWheelLeft> <Nop>
      nnoremap <S-ScrollWheelUp> <ScrollWheelRight>
      nnoremap <S-ScrollWheelDown> <ScrollWheelLeft>

      allow_remote_control yes
      remote_control_password yes
      editor   /etc/profiles/per-user/lalit/bin/nvim
    '';
  };
}
