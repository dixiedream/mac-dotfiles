# Runs at login

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"


export ZDOTDIR="$HOME/.config/zsh"

#
# ~/.profile
#
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

# ~/ Clean-up:
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
