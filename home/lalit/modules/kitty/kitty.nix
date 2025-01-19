{ pkgs, username, ... }:
{
  # search using cmd+f
  home.file."/Users/${username}/.config/kitty/search.py".source = ./search.py;
  home.file."/Users/${username}/.config/kitty/scroll_mark.py".source = ./scroll_mark.py;

  programs.kitty = {
    enable = true;
    package = pkgs.emptyDirectory;

    settings = {
      background_blur = 24;
      allow_remote_control = true;
      window_padding_width = 25;
      confirm_os_window_close = 0;
      hide_window_decorations = "titlebar-only";

      cursor_shape = "underline";
      cursor_trail = 4;

      tab_bar_style = "powerline";
      tab_bar_edge = "top";
      tab_bar_align = "left";
      tab_powerline_style = "slanted";
    };

    keybindings = {
      # switch tabs
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";

      # search using cmd+f
      "cmd+f" =
        "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
    };

    shellIntegration = {
      mode = "no-cursor";
      enableZshIntegration = true;
    };

    extraConfig = ''
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
