# Andrew's zshrc

# Enable 256 colors
export TERM="xterm-256color"

# Load antigen
source $HOME/.zsh/antigen.zsh

### Fix slowness of pastes with zsh-syntax-highlighting
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

# Add oh-my-zsh repo
antigen use oh-my-zsh

# Install oh-my-zsh plugins
antigen bundle git
antigen bundle history-substring-search
antigen bundle docker
antigen bundle aws
antigen bundle extract
antigen bundle bazel
antigen bundle colored-man-pages
antigen bundle command-not-found


# Install other plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Apply it
antigen apply

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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
