{
  pkgs,
  config,
  username,
  ...
}:
{
  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    packages = with pkgs; [
      # from my nur ( nix user repository )
      lalit64-nur.monolisa-nf # MonoLisa Nerd Font Mono
      # macos utils
      aerospace
      sketchybar
      sbarlua.sbarlua
      pika
      raycast
      zoom-us
      docker
      keka
      vesktop
      youtube-music
      qbittorrent
      # java
      zulu
      # packages
      vim
      automake
      base16-schemes
      bun
      cmatrix
      cocoapods
      deno
      dipc
      docker
      docker-compose
      eslint
      eza
      fd
      ffmpeg
      fontconfig
      fzf
      gcc
      gh
      glow
      httpie
      ice-bar
      imagemagick
      jq
      lua54Packages.lua
      sketchybar-app-font
      nixd
      nixfmt-rfc-style
      nil
      pnpm
      prettierd
      pywal
      pywalfox-native
      portaudio
      ripgrep
      rustup
      starship
      stow
      typescript
      utm
      watchman
      wget
      zathura
      zig
      zoxide

      # fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
    ];

    file = {
      # pywal themes
      "/Users/${username}/.config/wal".source = config.lib.file.mkOutOfStoreSymlink ./wal;

      # pywal reload scrip
      "/Users/${username}/wal-reload.sh".source = config.lib.file.mkOutOfStoreSymlink ./wal-reload.sh;

      # wallpapers
      "/Users/${username}/wallpapers".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers;

      # pywal cache
      # ~/.cache/wal
      "/Users/${username}/.cache/wal".source = config.lib.file.mkOutOfStoreSymlink ./wal-cache;
    };
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager = {
      enable = true;
    };
    # mise-en-place used for managing dev-tools
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
          luajit = "2.1";
        };
      };
    };
    # prompt
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
      };
    };
    # fetch
    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "/Users/${username}/wallpapers/nix-darwin.png";
          type = "kitty-direct";
          width = 32;
          height = 10;
        };
        modules = [
          "os"
          "host"
          "uptime"
          "packages"
          "shell"
          "terminal"
          "terminalfont"
          "cpu"
          "gpu"
          "colors"
        ];
      };
    };

    #git
    git = {
      enable = true;
      userName = "Lalit Yalamanchili";
      userEmail = "lalit.yalamanchili@gmail.com";
    };

    bat = {
      enable = true;
    };

    btop = {
      enable = true;
    };
    # better ls
    eza.enable = true;
  };
}
