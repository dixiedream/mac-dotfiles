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
export BROWSER="google-chrome-stable"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export HI_DPI=1

# ~/ Clean-up:
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Start X if not
# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
[ "$(tty)" = "/dev/tty2" ] && ! pgrep -x Xorg >/dev/null && exec startx ~/.xinitrc xfce
#[ "$(tty)" = "/dev/tty1" ] && export DE="awesome"
#[ "$(tty)" = "/dev/tty2" ] && export DE="xfce"
