#!/bin/sh

#splash screen for when you open terminal show ascii art and a message
$ASCII_SCRIPT_DIR/displayascii.sh
echo "          Welcome back $USER \n   Its $(date) \n"

# Enable colors and change prompt:
autoload -U colors && colors    # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

#append to history file instead of replace it
setopt appendhistory

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HISTORY_LOCATION

# some useful options (man zshoptions)
setopt autocd 

#setopt extendedglob nomatch 
setopt interactive_comments

stty stop undef     # Disable ctrl-s to freeze terminal.

zle_highlight=('paste:none') #stop highlighting when pasting to terminal

# stop beeping sometimes
unsetopt BEEP

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select 
# auto complete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Colorize completions using default `ls` colors. 
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.




# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char




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

#autosuggest strategy will first search history, then the completion engine
#ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#or auto suggest just use the completion engine and not history 
#SEE WHICH ONE IS BETTER THAN DELETE THE OTHER
ZSH_AUTOSUGGEST_STRATEGY=(completion)

# Key-bindings
# ctrl + space to accept the auto suggestion
bindkey '^ ' autosuggest-accept

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


#If we find a directory cd to that elif its a file, then cd to the directory that file is in
function fzf_folder_jump(){
    #look 3 files deep and reverse is top to bottom rather than bottom to top
    res="$(find . -maxdepth 3 | fzf --reverse --header='Jump to location')"
    #dirname gets the directory name where the file is in 
    if [ -f "$res" ]; then
        echo cd "$(dirname $res)"
        cd "$(dirname $res)"
    elif [ -d "$res" ]; then
        echo cd $res
        cd $res
    fi

}

bindkey -s '^f' 'fzf_folder_jump\n' 
 
#MAYBEDELETE THIS
bindkey '^[[P' delete-char



#Open new st terminal window in our current directory and doesn't block terminal keybind 
###########~~CHANGE THE BINDING LATER TO A BETTER ONE 
bindkey -s '^e' 'st > /dev/null 2>&1 & disown\n'



###get the default fzf keybindings 
#ctrl + R = history search
#alt + C = cd to change directory
#ctrl + T = search file name to type into terminal
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

