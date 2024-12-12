{ pkgs, ... }: {
  # .zshenv
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };

    shellAliases = {
      nixswitch = "darwin-rebuild switch --flake ~/.config/nix-darwin#lalits-mbp";
      wal = "wal -o \"/Users/lalit/wal-reload.sh\" -s";
      cd = "z";
      ls = "eza --icons";
      tree = "eza --icons --tree";
    };

    initExtra = ''
      export PATH="$PATH:/Users/lalit/.local/bin"
      export PNPM_HOME="/"
      export PATH="/Users/lalit/Library/pnpm:$PATH"
      export PATH="$PATH:$HOME/.cargo/bin"
      export EDITOR=nvim

      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(zoxide init zsh)"

      sudo yabai --load-sa
    '';

    oh-my-zsh = {
      enable = true;
    };
  };
}
