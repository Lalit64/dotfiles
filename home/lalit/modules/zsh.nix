{ pkgs, ... }:
{
  # .zshenv
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };

    shellAliases = {
      nixswitch = "echo 'make sure to run git add' && darwin-rebuild switch --flake ~/.config/snowflake#lalits-mbp";
      wal = "${pkgs.pywal}/bin/wal -o \"/Users/lalit/wal-reload.sh\" -s";
      cd = "z";
      ls = "${pkgs.eza}/bin/eza --icons";
      tree = "${pkgs.eza}/bin/eza --icons --tree";
    };

    initExtra = ''
      export PATH="$PATH:/Users/lalit/.local/bin"
      export PNPM_HOME="/"
      export PATH="/Users/lalit/Library/pnpm:$PATH"
      export PATH="$PATH:$HOME/.cargo/bin"
      export EDITOR=${pkgs.neovim}/bin/nvim

      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"

      sudo ${pkgs.yabai}/bin/yabai --load-sa
    '';

    oh-my-zsh = {
      enable = true;
    };
  };
}
