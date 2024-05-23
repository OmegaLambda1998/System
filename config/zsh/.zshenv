#
# WLRoots Environment Variables
#

export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER="vulkan"

#
# Hardware Acceleration Environment Variables
#

# VA-API Hardware Acceleration
export LIBVA_DRIVER_NAME="radeonsi"

# VDPAU Hardware Acceleration
export VDPAU_DRIVER="radeonsi"

# Ensure Vlukan searches for radeon drivers first
export VK_DRIVER_FILES="/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json"

#
# Wayland Compatibility Environment Variables
#

# GDK
# Use Wayland
export GDK_BACKEND=wayland

# QT
# Use Wayland, falling back to X11 if needed
export QT_QPA_PLATFORM="wayland;xcb"
# Calculate the DPI from the physical size and resolution of the screen
export QT_WAYLAND_FORCE_DPI=physical
# Don't show QT window decorations
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Automatic scaling based on monitor's pixel density
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# SDL2
# Use Wayland, falling back to X11 if needed
export SDL_VIDEODRIVER="wayland,x11"

# Electron
# Use Wayland if using Electron version >= 28 
# ~/.config/electron-flags.conf defines command line flags which enforce this for older version of Electron
export ELECTRON_OZONE_PLATFORM_HINT="wayland"

# Java
# Fix wayland bug
export _JAVA_AWT_WM_NONREPARENTING=1

# Firefox
# Use Wayland - also important for programs which use firefox as a backend
export MOZ_ENABLE_WAYLAND=1

#
# XDG Environment Variables
#

# $DOAS_HOME defined in /etc/zsh/zshenv
# DOAS_HOME="/home/${DOAS_USER:-$USER}"
export XDG_SESSION_DESKTOP="sway"
export XDG_CURRENT_DESKTOP="$XDG_SESSION_DESKTOP"
export XDG_CONFIG_HOME="$DOAS_HOME/.config"
export XDG_CACHE_HOME="$DOAS_HOME/.cache"
export XDG_DATA_HOME="$DOAS_HOME/.local/share"
export XDG_STATE_HOME="$DOAS_HOME/.local/state"
export XDG_DESKTOP_DIR="$DOAS_HOME/User"
export XDG_DOWNLOAD_DIR="$DOAS_HOME/User/Downloads"
export XDG_TEMPLATES_DIR="$DOAS_HOME/User/Templates"
export XDG_PUBLICSHARE_DIR="$DOAS_HOME/User/Public"
export XDG_DOCUMENTS_DIR="$DOAS_HOME/User/Documents"
export XDG_MUSIC_DIR="$DOAS_HOME/User/Music"
export XDG_PICTURES_DIR="$DOAS_HOME/User/Pictures"
export XDG_VIDEOS_DIR="$DOAS_HOME/User/Videos"

#
# Shorthand for XDG directories
#

export CONFIG="$XDG_CONFIG_HOME"
export CACHE="$XDG_CACHE_HOME"
export DATA="$XDG_DATA_HOME"
export STATE="$XDG_STATE_HOME"
export DESKTOP=$XDG_DESKTOP_DIR
export DOWNLOAD=$XDG_DOWNLOAD_DIR
export TEMPLATES=$XDG_TEMPLATES_DIR
export PUBLICSHARE=$XDG_PUBLICSHARE_DIR
export DOCUMENTS=$XDG_DOCUMENTS_DIR
export MUSIC=$XDG_MUSIC_DIR
export PICTURES=$XDG_PICTURES_DIR
export VIDEOS=$XDG_VIDEOS_DIR

#
# Useful user directories
#

export LOCAL="$DOAS_HOME/.local"
export LBIN="$LOCAL/bin"
export LAUNCHERS="$LBIN/launchers"

export BASE="$DOAS_HOME/User"
export TESTS="$BASE/Tests"
export NOTES="$BASE/Notes"

#
# Preferred software
#

# Terminal
export TERM=wezterm

# Options to pass to $TERM to open a new session and execute a command
export TERMINAL_OPTS="-e" 
export TERMINAL="/usr/bin/$TERM $TERMINAL_OPTS"

# Editor
export EDITOR=/usr/bin/nvim
export VISUAL="$TERMINAL $EDITOR"

# Pagers

# Options to pass to $EDITOR to make it work as a PAGER
export PAGER_OPTS=""
export PAGER="$EDITOR $PAGER_OPTS -"

# Options to pass to $EDITOR to make it work as a MANPAGER
export MANPAGER_OPTS="+Man!"
export MANPAGER="$EDITOR $MANPAGER_OPTS -"

# Browser
export BROWSER="/usr/bin/qutebrowser"

# File Manager
export FILEMANAGER="/usr/bin/yazi"

#
# Software specific environment variables
#

# Systemd

# Set the editor used by systemd
export SYSTEMD_EDITOR="$EDITOR"

# Set the pager used by systemd
export SYSTEMD_PAGER="$PAGER"

# Is the pager secure?
export SYSTEMD_PAGERSECURE=true

# Colour systemd output
export SYSTEMD_COLORS=true
