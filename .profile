# Runs at login

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export ZDOTDIR="$HOME/.config/zsh"

#
# ~/.profile
#
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# ~/ Clean-up:
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"

# Start X if not
# Start graphical server if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
