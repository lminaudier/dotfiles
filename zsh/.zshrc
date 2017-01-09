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

####################
# Custom Functions #
####################

nix-search () {
  nix-env -qa \* -P | fgrep -i "$1";
}

###########
# Aliases #
###########

alias git='hub'
alias gb='hub browse'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias music='ncmpcpp'
alias pdf='zathura'

###################
# Antigen bundles #
###################

# Load oh-my-zsh lib
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen theme avit

# Tell antigen that you're done.
antigen apply

##########
# Direnv #
##########

eval "$(direnv hook zsh)"

