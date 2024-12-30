{
  pkgs,
  config,
  ...
}:
{
  home = {
    username = "lalit";
    homeDirectory = "/Users/lalit";
    packages = with pkgs; [
      # macOS utils
      pika
      raycast
      zoom-us
      docker
      keka
      vesktop
      # Java
      zulu
      # Packages
      vim
      automake
      base16-schemes
      bat
      bun
      cmatrix
      cocoapods
      deno
      dipc
      docker-compose
      eslint
      eza
      fastfetch
      fd
      ffmpeg
      fontconfig
      fzf
      gcc
      gh
      glow
      ice-bar
      imagemagick
      jq
      luajit
      mpv
      nixd
      nixfmt-rfc-style
      nil
      pnpm
      portaudio
      prettierd
      pywal
      ripgrep
      rustup
      starship
      stow
      terminal-notifier
      typescript
      watchman
      wget
      zig
      zoxide

      # Fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
    ];

    file = {
      # ~/.config directory
      "/Users/lalit/.config/karabiner".source =
        config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/snowflake/home/lalit/dotfiles/.config/karabiner";
      "/Users/lalit/.config/wal".source =
        config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/snowflake/home/lalit/dotfiles/.config/wal";
      # ~/ directory
      "/Users/lalit/wal-reload.sh".source =
        config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/snowflake/home/lalit/dotfiles/wal-reload.sh";
      "/Users/lalit/wallpapers".source =
        config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/snowflake/home/lalit/dotfiles/wallpapers";
      # ~/.cache/wal
      "/Users/lalit/.cache/wal".source =
        config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/snowflake/home/lalit/dotfiles/.cache/wal";
      # bar
      "/Users/lalit/Library/Application Support/Übersicht/widgets/simple-bar".source =
        config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/snowflake/home/lalit/dotfiles/bar";
    };
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager = {
      enable = true;
    };
    mise = {
      enable = true;
      enableZshIntegration = true;
      globalConfig = {
        tools = {
          node = "lts";
          python = [
            "3.10"
            "3.11"
          ];
          ruby = "3.1";
        };
      };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
      };
    };
    eza.enable = true;
    git.enable = true;
  };
}
