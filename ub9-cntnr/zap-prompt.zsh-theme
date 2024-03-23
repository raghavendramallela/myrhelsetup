#!/bin/zsh

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git 

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst


zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"

PROMPT="
%B%{$fg[yellow]%}raghu(ubi9-cntnr) % %(?:%{$fg_bold[yellow]%}➜ in %B%{$fg[white]%}[:%{$fg_bold[red]%}➜ in %B%{$fg[white]%}[)%{$fg[white]%}%c%{$reset_color%}"
PROMPT+="%B%{$fg[white]%}] %B%{$fg[yellow]%}- on %D{[%a %f/%m/%y]} at [%D{%T}]
%B%{$fg[white]%}$ "

PROMPT=${PROMPT/\%c/\%~}

# bash PS1:
# PS1='\u@\h\[\e[00;36m in \w\e[00;32m on $(date +'%d-%m-%Y at %T hrs') \e[00;35m\]\n$ \[\e[0m\]'
