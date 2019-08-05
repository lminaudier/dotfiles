source ~/.zsh_plugins.sh

# zsh-users/zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ZSH history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered

# ZSH autocomplete
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

function zshreload() {
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

#########################
# Environment Variables #
#########################

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

zstyle ':completion:*:make:*:targets' call-command true # outputs all possible results for make targets
zstyle ':completion:*:make:*' tag-order targets
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'
