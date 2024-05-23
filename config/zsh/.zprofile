# Autologin to sway
# Only autologin if not in a wayland session ($WAYLAND_DISPLAY is null) and in TTY 1 ($XDG_VTNR equals 1) 
if [ -z $WAYLAND_DISPLAY ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec sway
fi
