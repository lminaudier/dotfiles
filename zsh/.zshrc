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

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/bin:$PATH"
export CDPATH="${GOPATH}/src:${CDPATH}"

####################
# Custom Functions #
####################

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
antigen bundle zsh-users/zsh-autosuggestions
antigen theme norm

# Tell antigen that you're done.
antigen apply

##########
# Direnv #
##########

eval "$(direnv hook zsh)"

if [[ -s "/usr/local/opt/asdf/asdf.sh" ]]; then
  source /usr/local/opt/asdf/asdf.sh
fi

###########
# Aliases #
###########

alias ssh="TERM=xterm ssh"

#############
# ls colors #
#############

export LS_COLORS=$LS_COLORS:'di=1;32:'
export LS_COLORS=$LS_COLORS:'ex=0;31:'

############
# Autojump #
############

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
