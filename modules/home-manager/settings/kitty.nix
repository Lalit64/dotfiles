{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 13;
    };
    settings = {
      background_blur = 64;
      allow_remote_control = true;
      window_padding_width = 25;
      confirm_os_window_close = 0;
      macos_hide_titlebar = true;
    };
    extraConfig = ''
      ######### Theme #########
      include ~/.cache/wal/colors-kitty.conf
      background_opacity      0.9
      modify_font cell_height 25px
      cursor_shape            underline

      ######## Tabs ########

      tab_bar_style powerline
      tab_bar_edge  top
      tab_bar_align left
      tab_powerline_style slanted

      ######## Keymaps #########

      map cmd+1 goto_tab 1
      map cmd+2 goto_tab 2
      map cmd+3 goto_tab 3
      map cmd+4 goto_tab 4
      map cmd+5 goto_tab 5
      map cmd+6 goto_tab 6
      map cmd+7 goto_tab 7
      map cmd+8 goto_tab 8
      map cmd+9 goto_tab 9
      map cmd+f launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id
      mouse_map cmd+left click ungrabbed no_op

      nnoremap <ScrollWheelRight> <Nop>
      nnoremap <ScrollWheelLeft> <Nop>
      nnoremap <S-ScrollWheelUp> <ScrollWheelRight>
      nnoremap <S-ScrollWheelDown> <ScrollWheelLeft>

      allow_remote_control yes
      shell_integration    enabled
      shell_integration    no-cursor
      remote_control_password yes
      editor               /opt/homebrew/bin/nvim
    '';
  };
}
