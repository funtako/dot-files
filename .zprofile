#Default programs
#$HOME/.local/bin is where python pip installs to
export PATH=$PATH:$HOME/scripts:$HOME/scriptsmore:$HOME/.local/bin
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="librewolf"

#XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export HISTORY_LOCATION=$HOME/.zsh_history
export SCRIPTS_LOC=$HOME/scripts
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
#zsh config dir
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ASCII_SCRIPT_DIR=$SCRIPTS_LOC/ASCII-ART
export ASCII_IMAGES_DIR=$ASCII_SCRIPT_DIR/images
#total number of ascii art images you have (used in a script to display a random one)
export TOTAL_ASCII_NUMBER=$(ls $ASCII_IMAGES_DIR -1 | wc -l)


#source secret variables
source $HOME/secretvariables/vpsvariables

#if we login to tty1 then start xinit from the location of our xinitrc
if [[ "$(tty)" = "/dev/tty1" ]]; then
        startx "$XINITRC"
fi

