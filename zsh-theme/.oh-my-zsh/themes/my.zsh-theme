function prompt_char {
   git branch >/dev/null 2>/dev/null && echo '±' && return
   echo '$'
}

if [ -z "$HOSTNAME" ]; then HOSTNAME=$(hostname); fi

PROMPT='%{$fg_bold[magenta]%}%n%{$reset_color%} at %{$fg_bold[cyan]%}$HOSTNAME%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
