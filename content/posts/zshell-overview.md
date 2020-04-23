---
title: Z-shell overview
date: 2019-12-12
author: Haolin Yang
categories: ['Terminal']
tags:
    - zsh
    - bash
---

## Reference

Very useful blog:

[http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#username-and-hostname](http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#username-and-hostname)

[http://zsh.sourceforge.net/Intro/intro_12.html#SEC12](http://zsh.sourceforge.net/Intro/intro_12.html#SEC12)

## Variable

| name |      usage       |
| :--: | :--------------: |
|  %m  |     Hostname     |
|  %n  |     Username     |
|  %d  | Directory from / |
|  %~  | Directory from ~ |
|  %t  |    time (12)     |
|  %T  |    time (24)     |

%d and %~ can add a number to specify how many previous path will show. Like `%1~`

## Guide to zsh

Here is the link to [A User's Guide to the Z-Shell](http://zsh.sourceforge.net/Guide/zshguide.html)

## single quotes & double quotes

```
RPROMPT="$(command)"  # this will run command, then set RPROMPT to the result
RPROMPT='$(command)'  # this will set RPROMPT to run command each time it is printed
```

## Date

`man Date`

|       |                                                                     |
| :---: | :-----------------------------------------------------------------: |
|  %a   |            locale's abbreviated weekday name (e.g., Sun)            |
|  %A   |              locale's full weekday name (e.g., Sunday)              |
|  %b   |             locale's abbreviated month name (e.g., Jan)             |
|  %B   |              locale's full month name (e.g., January)               |
|  %c   |       locale's date and time (e.g., Thu Mar 3 23:05:25 2005)        |
|  %C   |      century; like %Y, except omit last two digits (e.g., 20)       |
|  %d   |                       day of month (e.g., 01)                       |
|  %D   |                       date; same as %m/%d/%y                        |
|  %e   |              day of month, space padded; same as %\_d               |
|  %F   |                     full date; same as %Y-%m-%d                     |
|  %g   |         last two digits of year of ISO week number (see %G)         |
|  %G   |   year of ISO week number (see %V); normally useful only with %V    |
|  %h   |                             same as %b                              |
|  %H   |                            hour (00..23)                            |
|  %I   |                            hour (01..12)                            |
|  %j   |                       day of year (001..366)                        |
|  %k   |              hour, space padded ( 0..23); same as %\_H              |
|  %l   |              hour, space padded ( 1..12); same as %\_I              |
|  %m   |                           month (01..12)                            |
|  %M   |                           minute (00..59)                           |
|  %n   |                              a newline                              |
|  %N   |                 nanoseconds (000000000..999999999)                  |
|  %p   |     locale's equivalent of either AM or PM; blank if not known      |
|  %P   |                       like %p, but lower case                       |
|  %r   |           locale's 12-hour clock time (e.g., 11:11:04 PM)           |
|  %R   |               24-hour hour and minute; same as %H:%M                |
|  %s   |                seconds since 1970-01-01 00:00:00 UTC                |
|  %S   |                           second (00..60)                           |
|  %t   |                                a tab                                |
|  %T   |                       time; same as %H:%M:%S                        |
|  %u   |                   day of week (1..7); 1 is Monday                   |
|  %U   |   week number of year, with Sunday as first day of week (00..53)    |
|  %V   |     ISO week number, with Monday as first day of week (01..53)      |
|  %w   |                   day of week (0..6); 0 is Sunday                   |
|  %W   |   week number of year, with Monday as first day of week (00..53)    |
|  %x   |            locale's date representation (e.g., 12/31/99)            |
|  %X   |            locale's time representation (e.g., 23:13:48)            |
|  %y   |                  last two digits of year (00..99)                   |
|  %Y   |                                year                                 |
|  %z   |                +hhmm numeric time zone (e.g., -0400)                |
|  %:z  |               +hh:mm numeric time zone (e.g., -04:00)               |
| %::z  |            +hh:mm:ss numeric time zone (e.g., -04:00:00)            |
| %:::z | numeric time zone with : to necessary precision (e.g., -04, +05:30) |
|  %Z   |            alphabetic time zone abbreviation (e.g., EDT)            |

## My ZSH theme

```bash
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

PROMPT='%{$fg[yellow]%}🜲 %{$fg[red]%}%n%{$reset_color%} %{$fg_bold[green]%}%2~ $(git_prompt_info)%{$reset_color%}$(virtualenv_info)$(prompt_char) '

RPROMPT='$(timeClock)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="⥀ "
ZSH_THEME_GIT_PROMPT_CLEAN=""
```
