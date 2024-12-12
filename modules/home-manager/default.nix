{ pkgs, config, ... }: {
  imports = [
    ./settings/zsh.nix
    ./settings/kitty.nix
    ./settings/zed.nix
    ./settings/cava.nix
    ./settings/vscode.nix
  ];
  home = {
    username = "lalit";
    homeDirectory = "/Users/lalit";
    packages = [
      # macOS utils
      pkgs.pika
      pkgs.raycast
      pkgs.zoom-us
      pkgs.docker
      pkgs.hidden-bar
      pkgs.keka
      pkgs.vesktop
      # Java
      pkgs.zulu
      # Packages
      pkgs.vim
      pkgs.automake
      pkgs.bat
      pkgs.bun
      pkgs.cmatrix
      pkgs.cocoapods
      pkgs.deno
      pkgs.dipc
      pkgs.docker-compose
      pkgs.eslint
      pkgs.eza
      pkgs.fd
      pkgs.ffmpeg
      pkgs.fontconfig
      pkgs.fzf
      pkgs.gcc
      pkgs.gh
      pkgs.glow
      pkgs.imagemagick
      pkgs.jq
      pkgs.luajit
      pkgs.nodejs_23
      pkgs.pfetch
      pkgs.pnpm
      pkgs.portaudio
   	  pkgs.prettierd
      pkgs.pywal
   	  pkgs.uv
   	  pkgs.ripgrep
   	  pkgs.ruby
   	  pkgs.rustup
   	  pkgs.starship
   	  pkgs.stow
   	  pkgs.typescript
   	  pkgs.wget
   	  pkgs.zig
   	  pkgs.zoxide
    ];

    file = {
      # ~/.config directory
      "/Users/lalit/.config/karabiner".source = config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/nix-darwin/modules/dotfiles/.config/karabiner";
      "/Users/lalit/.config/wal".source = config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/nix-darwin/modules/dotfiles/.config/wal";
      # ~/ directory
      "/Users/lalit/.simplebarrc".source = config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/nix-darwin/modules/dotfiles/.simplebarrc";
      "/Users/lalit/wal-reload.sh".source = config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/nix-darwin/modules/dotfiles/wal-reload.sh";
      "/Users/lalit/wallpapers".source = config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/nix-darwin/modules/dotfiles/wallpapers";
      # ~/.cache/wal
      "/Users/lalit/.cache/wal".source = config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/nix-darwin/modules/dotfiles/.cache/wal";
      # Ubersicht widgets
      "/Users/lalit/Library/Application Support/Übersicht/widgets/bar".source = config.lib.file.mkOutOfStoreSymlink "/Users/lalit/.config/nix-darwin/modules/dotfiles/bar";
    };
  };

  programs = {
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

  home.stateVersion = "24.05";
}
