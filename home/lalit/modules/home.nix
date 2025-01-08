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
      # from my nur ( nix user repository )
      lalit64-nur.sbar-lua
      # macos utils
      pika
      raycast
      zoom-us
      docker
      keka
      vesktop
      # java
      zulu
      # packages
      vim
      automake
      base16-schemes
      bat
      bun
      btop
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
      gcc
      gh
      glow
      httpie
      ice-bar
      imagemagick
      jq
      lua54Packages.lua
      sketchybar-app-font
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

      # fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
    ];

    file = {
      # pywal themes
      "/Users/lalit/.config/wal".source =
        config.lib.file.mkOutOfStoreSymlink ./wal;

      # pywal reload scrip 
      "/Users/lalit/wal-reload.sh".source =
        config.lib.file.mkOutOfStoreSymlink ./wal-reload.sh;

      # wallpapers
      "/Users/lalit/wallpapers".source =
        config.lib.file.mkOutOfStoreSymlink ./wallpapers;

      # pywal cache
      # ~/.cache/wal
      "/Users/lalit/.cache/wal".source =
        config.lib.file.mkOutOfStoreSymlink ./wal-cache;

      ################ sketchybar ################
      ".config/sketchybar" = {
        source = ./config/sketchybar;
        recursive = true;
        onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
      };
      ".local/share/sketchybar_lua/sketchybar.so" = {
        source = "${pkgs.lalit64-nur.sbar-lua}/lib/sketchybar.so";
        onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
      };
      ".config/sketchybar/sketchybarrc" = {
        text = ''
          #!/usr/bin/env ${pkgs.lua54Packages.lua}/bin/lua
          -- Load the sketchybar-package and prepare the helper binaries
          require("helpers")
          require("init")

          -- Enable hot reloading
          sbar.exec("sketchybar --hotload true")
        '';
        executable = true;
        onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
      };
        #############################################
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
          source = "/Users/lalit/wallpapers/nix-darwin.png";
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
    # better ls
    eza.enable = true;
    # git
    git.enable = true;
  };
}
