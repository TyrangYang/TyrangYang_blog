---
title: My Zsh setting
date: 2020-01-08
author: Haolin Yang
categories: ["Terminal"]
tag:
    - ohmyzsh
    - zsh
    - bash
    - terminal
---

## Zsh & Bash

Since MacOs 10.15(Catalina). The default shell switch from bash to zsh. It is hard to say which one is better however Zsh has been used more widely than bash especially from Linux user.

## Zsh

The Z shell (also known as zsh) is a Unix shell that is built on top of bash (the default shell for macOS (Before MacOs Catalina)) with additional features. It's recommended to use zsh over bash. It's also highly recommended to install a framework with zsh as it makes dealing with configuration, plugins and themes a lot nicer.

Install zsh using Homebrew:

> brew install zsh

Now you should install a framework, we recommend to use Oh My Zsh or Prezto. Note that you should pick one of them, not use both.

The configuration file for zsh is called .zshrc and lives in your home folder (~/.zshrc).

## OhMyZsh

Webpage for [OhMyZsh](https://ohmyz.sh)

### Installation

Via curl: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Via wegt: `sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"`

> No `$` which is shows on webpage.

### Themes

There are bunch of different themes by default and all in themes folder. But I use a customize one. [link](/file/TyrangYang.zsh-theme)

Thanks for the [article from Steve Losh](https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/). It actually give me many idea.

### My own theme

[Link](/file/TyrangYang.zsh-theme)

I mix several themes and add some feature by my self. There something can list:

#### My own color theme and character

The color using the default color theme provided by terminal.app itself. You can change it in `terminal>preference`.

Character is searching from [shapeCatcher](http://shapecatcher.com/index.html).

#### PROMPT

`%~` in PROMPT means print out the whole path. In steven's version, he wrote a new function to limit the number of path that will be displayed. However, we can add a number to achieve the goal. `%1~` will just show the current directory name. `%2~` also show the previous one.

#### timeClock

I wrote a function to display the current time by a clock character. The basic idea is to get the system time and to match correct USCII code. The drawbacks are that it only update after enter a new line and clock only have characters every 30 mins.

### plugin

#### git

This is default plugin which associate all git features.

> `g` can represent `git`

#### fzf

[fzf](https://github.com/junegunn/fzf) a general-purpose command-line fuzzy finder. On it's own it's not very useful but when combined with other tools it becomes super powerful.

We need install(_brew install fzf_) fzf first and [add it in zsh plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf).

A [video tutorial](https://www.youtube.com/watch?v=qgG5Jhi_Els)
