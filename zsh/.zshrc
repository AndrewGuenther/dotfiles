# Andrew's zshrc

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search docker poetry aws extract)

# Enable 256 colors
export TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

# Aliases
alias g="git "
alias pdf="evince 2> /dev/null"
alias fucking="sudo "
alias activate="source venv/bin/activate"
alias g~='$(git rev-parse --show-toplevel)'
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"

# Source the local rc file
if [[ -a $HOME/.myzshrc ]]; then
   source $HOME/.myzshrc
fi

# Initialize starship
eval "$(starship init zsh)"
