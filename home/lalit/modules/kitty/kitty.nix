{ ... }:
{
  home.file."/Users/lalit/.config/kitty/search.py".source = ./search.py;
  home.file."/Users/lalit/.config/kitty/scroll_mark.py".source = ./scroll_mark.py;
  programs.kitty = {
    enable = true;

    settings = {
      background_blur = 32;
      allow_remote_control = true;
      window_padding_width = 25;
      confirm_os_window_close = 0;
      macos_hide_titlebar = true;

      ######## Cursor ########
      cursor_shape = "underline";
      cursor_trail = 4;

      ######## Tabs ########
      tab_bar_style = "powerline";
      tab_bar_edge = "top";
      tab_bar_align = "left";
      tab_powerline_style = "slanted";
    };
    keybindings = {
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+f" =
        "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
    };
    shellIntegration = {
      mode = "no-cursor";
      enableZshIntegration = true;
    };
    extraConfig = ''
      modify_font cell_height 25px
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
