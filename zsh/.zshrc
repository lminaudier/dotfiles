# Load antigen
if [[ -s "$HOME/.antigen.zsh" ]]; then
  source "$HOME/.antigen.zsh"
else
  echo "Antigen is not setup. ~/.antigen.zsh not found."
fi

##############
# ZSH config #
##############

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000


#########################
# Environment Variables #
#########################

export NIXPKGS_ALLOW_UNFREE=1
export GOPATH="$HOME/Projects/go"
export PATH="$GOPATH/bin:$HOME/bin:$PATH"
export CDPATH="${GOPATH}/src:${CDPATH}"

####################
# Custom Functions #
####################

nix-search () {
  nix-env -qa \* -P | fgrep -i "$1";
}

# bc - An arbitrary precision calculator language
function =
{
  echo "$@" | bc -l
}
alias calc="="

###################
# Antigen bundles #
###################

# Load oh-my-zsh lib
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen theme norm

# Tell antigen that you're done.
antigen apply

##########
# Direnv #
##########

eval "$(direnv hook zsh)"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

###########
# Aliases #
###########

alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias ssh="TERM=xterm ssh"
alias open="xdg-open"

#############
# ls colors #
#############

export LS_COLORS=$LS_COLORS:'di=1;32:'
export LS_COLORS=$LS_COLORS:'ex=0;31:'
