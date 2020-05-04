#export GDK_SCALE=2
setxkbmap -option compose:rctrl
setxkbmap -option compose:ralt
#setxkbmap -option ctrl:nocaps
export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1

export PATH="$HOME/.cargo/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
