#!/bin/sh

# Enable colors and change prompt:
autoload -U colors && colors    # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt appendhistory

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

# some useful options (man zshoptions)
setopt autocd menucomplete
#setopt extendedglob nomatch 
setopt interactive_comments

stty stop undef     # Disable ctrl-s to freeze terminal.

zle_highlight=('paste:none') #stop highlighting when pasting to terminal

# stop beeping sometimes
unsetopt BEEP

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.


# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source #requires zsh-functions
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-vim-mode"


# Plugins
zsh_add_plugin "fast-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

#change color of suggestions
#look up zshell colors to see the color number u want
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Key-bindings
bindkey -s '^o' 'lfcd\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char



