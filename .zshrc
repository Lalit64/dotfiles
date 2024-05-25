export PATH="${PATH}:/Users/lalit/Library/Python/3.11/bin"
export PATH="${PATH}:/Users/lalit/.local/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:/Users/lalit/.spicetify
export PNPM_HOME="/Users/lalit/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$PATH:/Users/lalit/.config/emacs/bin"
export PATH="$PATH:$HOME/.cargo/bin"

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/lalit/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export EDITOR=nvim

alias neofetch="neofetch --off"
alias wal="wal -o \"/Users/lalit/wal-reload.sh\" -s"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
function macfeh() {
    open -b "drabweb.macfeh" "$@"
}

export PF_INFO="title os host kernel wm uptime pkgs memory palette"
