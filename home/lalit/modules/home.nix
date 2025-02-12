{
  pkgs,
  lib,
  config,
  username,
  ...
}:
{
  home = {
    inherit username;
    homeDirectory = "/Users/${username}";
    packages = with pkgs; [
      # from my nur ( nix user repository )
      lalit64-nur.monolisa-nf # MonoLisa Nerd Font Mono
      lalit64-nur.cleanshot
      lalit64-nur.affinity-photo
      lalit64-nur.affinity-designer
      # macos utils
      aerospace
      sketchybar
      raycast
      zoom-us
      docker
      keka
      qbittorrent
      # java
      # zulu
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
      eza
      fd
      ffmpeg
      fontconfig
      fzf
      gcc
      gh
      glow
      git-lfs
      httpie
      ice-bar
      imagemagick
      jq
      logseq # notes app
      lua54Packages.lua
      nixd
      nixfmt-rfc-style
      nil
      pnpm
      prettierd
      portaudio
      rust-analyzer
      ripgrep
      sbarlua
      sketchybar-app-font
      stow
      typescript
      utm
      watchman
      wget
      zig
      zoxide
      zsh-autopair

      # fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
    ];

    file = {
      # wallpapers
      "/Users/${username}/wallpapers".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers;
    };
  };

  fonts.fontconfig.enable = true;

  catppuccin = {
    flavor = "mocha";
    accent = "blue";

    kitty.enable = true;
    starship.enable = true;
    bat.enable = true;
  };

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
          node = "latest";
          python = [
            "3.10"
            "3.11"
          ];
          ruby = "latest";
          rust = "latest";
          rust-analyzer = "latest";
          go = "latest";
        };
      };
    };
    # prompt
    starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = false;
        format = lib.concatStrings [
          "$directory"
          "$hostname"
          "$git_branch"
          "$git_status"
          ######
          "$fill"
          ######
          "$battery"
          "$nix_shell"
          "$lua"
          "$python"
          "$bun"
          "$nodejs"
          "$rust"
          "$swift"
          "$zig"
          "$cmd_duration"
          "$line_break"
          ######
          "$character"
        ];
        hostname = {
          ssh_only = false;
          style = "fg:blue";
          format = "[@$hostname ]($style)";
        };
        fill = {
          symbol = " ";
        };
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

    # nh cli
    nh = {
      enable = true;
      package = pkgs.nh;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/Users/${username}/.config/snowflake";
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
