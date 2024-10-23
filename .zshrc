#zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#zinit pkgs
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

#apps
eval "$(starship init zsh)"
eval "$(/Users/andy/.local/bin/mise activate zsh)"

#stuff
alias lsf='facad'
alias nix-rebuild='darwin-rebuild switch --flake ~/nix#mbp'
export PATH="$PATH:/usr/local/go/bin"
