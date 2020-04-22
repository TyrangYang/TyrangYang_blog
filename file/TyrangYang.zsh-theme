function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
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

PROMPT='%{$fg[yellow]%}🜲 %{$fg[red]%}%n%{$reset_color%} %{$fg_bold[green]%}%1~ $(git_prompt_info)%{$reset_color%}$(virtualenv_info)$(prompt_char) '

RPROMPT='$(timeClock)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="⥀ "
ZSH_THEME_GIT_PROMPT_CLEAN=""
