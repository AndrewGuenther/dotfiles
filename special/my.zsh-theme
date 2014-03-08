function prompt_char {
   git branch >/dev/null 2>/dev/null && echo '±' && return
   echo '$'
}

function git_info {
   git branch >/dev/null 2>/dev/null || return

   OUT="("

   UNTRACKED=$(git status -s | grep '^??' | wc -l)
   if [[ $UNTRACKED == "0" ]]; then
      UNTRACKED=""
   else
      OUT="$OUT%{$fg_bold[cyan]%}$UNTRACKED%{$reset_color%}"
   fi

   MODIFIED=$(git status -s | grep '^.M' | wc -l)
   if [[ $MODIFIED == "0" ]]; then
      MODIFIED=""
   else
      if [[ -n $UNTRACKED || -n $ADDED ]]; then
         OUT="$OUT, "
      fi
      OUT="$OUT%{$fg_bold[green]%}$MODIFIED%{$reset_color%}"
   fi

   DELETED=$(git status -s | grep '^.D' | wc -l)
   if [[ $DELETED == "0" ]]; then
      DELETED=""
   else
      if [[ -n $UNTRACKED || -n $ADDED || -n $MODIFIED ]]; then
         OUT="$OUT, "
      fi
      OUT="$OUT%{$fg_bold[red]%}$DELETED%{$reset_color%}"
   fi

   echo "$OUT)"
}

function virtualenv_info {
   [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT='%{$fg_bold[magenta]%}%n%{$reset_color%} at %{$fg_bold[cyan]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) $(virtualenv_info)$(git_info)
$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
