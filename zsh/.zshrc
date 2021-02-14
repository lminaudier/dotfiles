source ~/.zsh_plugins.sh

# zsh-users/zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

###############
# ZSH History #
###############
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered

################
# Autocomplete #
################
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion
zstyle ':completion:*:*:git:*' script /usr/local/share/zsh/site-functions/git-completion.bash
zstyle ':completion:*:make:*:targets' call-command true # outputs all possible results for make targets
zstyle ':completion:*:make:*' tag-order targets
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'
autoload -Uz compinit && compinit

#############
# Functions #
#############

function zshreload() {
    antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

#########################
# Environment Variables #
#########################
#
# see .zshenv
#

###########
# Aliases #
###########
alias ssh='TERM=xterm ssh'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias go='nocorrect go'
alias vim='nvim'
alias emc="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -a '' -n"

#####################
# tool integrations #
#####################
eval "$(fasd --init auto)"
eval "$(direnv hook zsh)"
[ -f "/usr/local/opt/asdf/asdf.sh" ] && . "/usr/local/opt/asdf/asdf.sh"
[ -f "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && . "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -z $EMACS ] && [ -f "${HOME}/.iterm2_shell_integration.zsh" ] && . "${HOME}/.iterm2_shell_integration.zsh"

#######
# NVM #
#######

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
