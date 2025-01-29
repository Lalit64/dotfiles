{
  pkgs,
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
      nixswitch = "cd /Users/${username}/.config/snowflake && ${pkgs.git}/bin/git add -A && ${pkgs.nh}/bin/nh darwin switch";
      ns = "cd /Users/${username}/.config/snowflake && ${pkgs.git}/bin/git add -A && ${pkgs.nh}/bin/nh darwin switch";
      nc = "${pkgs.nh}/bin/nh clean all";
      nu = "nix flake update --flake /Users/${username}/.config/snowflake";

      cd = "z";
      ls = "${pkgs.eza}/bin/eza --icons";
      tree = "${pkgs.eza}/bin/eza --icons --tree";
      ff = "${pkgs.fastfetch}/bin/fastfetch";
    };

    initExtra = ''
      export PNPM_HOME="/"
      export EDITOR=${pkgs.neovim}/bin/nvim

      # fix rust liconv stuff
      export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
      export LDFLAGS="-L/opt/homebrew/opt/libiconv/lib"
      export CPPFLAGS="-I/opt/homebrew/opt/libiconv/include"
      export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix)/lib:$(brew --prefix)/opt/libiconv/lib

      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
      eval "$(${pkgs.mise}/bin/mise activate zsh)"
      source "${pkgs.zsh-autopair}/share/zsh/zsh-autopair/autopair.zsh"
    '';

    oh-my-zsh = {
      enable = true;
    };
  };
}
