source "$HOME/.zsh/slimzsh/slim.zsh"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/bin:$PATH"
export CDPATH="${GOPATH}/src:${CDPATH}"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

alias ssh='TERM=xterm ssh'
alias cdr='cd $(git rev-parse --show-toplevel)'

eval "$(fasd --init auto)"
eval "$(direnv hook zsh)"
[ -f "/usr/local/opt/asdf/asdf.sh" ] && . "/usr/local/opt/asdf/asdf.sh"
[ -f "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && . "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

[ -z $EMACS ] && [ -f "${HOME}/.iterm2_shell_integration.zsh" ] && . "${HOME}/.iterm2_shell_integration.zsh"

alias go='nocorrect go'
alias org='vim ~/Notes'
