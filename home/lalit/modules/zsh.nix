{
  pkgs,
  hostname,
  username,
  ...
}:
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
      nixswitch = "echo 'make sure to run git add' && darwin-rebuild switch --flake ~/.config/snowflake#${hostname}";
      wal = "${pkgs.pywal}/bin/wal -o wal-reload";
      cd = "z";
      ls = "${pkgs.eza}/bin/eza --icons";
      tree = "${pkgs.eza}/bin/eza --icons --tree";
      ff = "${pkgs.fastfetch}/bin/fastfetch";
    };

    initExtra = ''
      export PATH="$PATH:/Users/${username}/.local/bin"
      export PNPM_HOME="/"
      export PATH="/Users/${username}/Library/pnpm:$PATH"
      export PATH="$PATH:$HOME/.cargo/bin"
      export EDITOR=${pkgs.neovim}/bin/nvim

      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
    '';

    oh-my-zsh = {
      enable = true;
    };
  };
}
