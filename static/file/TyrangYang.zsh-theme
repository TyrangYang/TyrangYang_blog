function prompt_char {
    git branch >/dev/null 2>/dev/null && echo ' ±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo ''
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function timeClock {
    HOUR=$(date +'%I') # 1 - 12
    MIN=$(date +'%M') # 0 - 59
    if [[ $HOUR -eq 1 && MIN -lt 30 ]]; then echo '\U1F550'
    elif [[ $HOUR -eq 1 && MIN -ge 30 ]]; then echo '\U1F55C'
    elif [[ $HOUR -eq 2 && MIN -lt 30 ]]; then echo '\U1F551'
    elif [[ $HOUR -eq 2 && MIN -ge 30 ]]; then echo '\U1F55D'
    elif [[ $HOUR -eq 3 && MIN -lt 30 ]]; then echo '\U1F552'
    elif [[ $HOUR -eq 3 && MIN -ge 30 ]]; then echo '\U1F55E'
    elif [[ $HOUR -eq 4 && MIN -lt 30 ]]; then echo '\U1F553'
    elif [[ $HOUR -eq 4 && MIN -ge 30 ]]; then echo '\U1F55F'
    elif [[ $HOUR -eq 5 && MIN -lt 30 ]]; then echo '\U1F554'
    elif [[ $HOUR -eq 5 && MIN -ge 30 ]]; then echo '\U1F560'
    elif [[ $HOUR -eq 6 && MIN -lt 30 ]]; then echo '\U1F555'
    elif [[ $HOUR -eq 6 && MIN -ge 30 ]]; then echo '\U1F561'
    elif [[ $HOUR -eq 7 && MIN -lt 30 ]]; then echo '\U1F556'
    elif [[ $HOUR -eq 7 && MIN -ge 30 ]]; then echo '\U1F562'
    elif [[ $HOUR -eq 8 && MIN -lt 30 ]]; then echo '\U1F557'
    elif [[ $HOUR -eq 8 && MIN -ge 30 ]]; then echo '\U1F563'
    elif [[ $HOUR -eq 9 && MIN -lt 30 ]]; then echo '\U1F558'
    elif [[ $HOUR -eq 9 && MIN -ge 30 ]]; then echo '\U1F564'
    elif [[ $HOUR -eq 10 && MIN -lt 30 ]]; then echo '\U1F559'
    elif [[ $HOUR -eq 10 && MIN -ge 30 ]]; then echo '\U1F565'
    elif [[ $HOUR -eq 11 && MIN -lt 30 ]]; then echo '\U1F55A'
    elif [[ $HOUR -eq 11 && MIN -ge 30 ]]; then echo '\U1F566'
    elif [[ $HOUR -eq 12 && MIN -lt 30 ]]; then echo '\U1F55B'
    elif [[ $HOUR -eq 12 && MIN -ge 30 ]]; then echo '\U1F567'
    fi
}

# Echoes information about Git repository status when inside a Git repository
# resource: https://joshdick.net/2017/06/08/my_git_prompt_for_zsh_revisited.html
function git_info {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && echo "%{$reset_color%}" && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="%{$fg[red]%}⇡NUM%{$reset_color%}"
  local BEHIND="%{$fg[cyan]%}⇣NUM%{$reset_color%}"
  local MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
  local UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
  local MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
  local STAGED="%{$fg[green]%}●%{$reset_color%}"

  local -a DIVERGENCES
  local -a FLAGS

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    FLAGS+=( "$MERGING" )
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    FLAGS+=( "$UNTRACKED" )
  fi

  if ! git diff --quiet 2> /dev/null; then
    FLAGS+=( "$MODIFIED" )
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    FLAGS+=( "$STAGED" )
  fi

  local -a GIT_INFO
  GIT_INFO+=( "\033[38;5;15m±" )
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
  GIT_INFO+=( "%{$fg[blue]%}$GIT_LOCATION❯%{$reset_color%}" )
  echo "${(j: :)GIT_INFO}"
}


# PROMPT='%{$fg[yellow]%}🜲 %{$fg[red]%}%n%{$reset_color%} %{$fg_bold[green]%}%1~ $(git_prompt_info)%{$reset_color%}$(virtualenv_info)$(prompt_char) '

# RPROMPT='$(timeClock)'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="⥀ "
# ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[yellow]%}🜲 %{$fg[red]%}%n%{$reset_color%} %{$fg_bold[green]%}%1~ $(git_info)$'\n' 
$(timeClock) '
# RPROMPT='$(timeClock)'
