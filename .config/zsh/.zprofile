#!/bin/zsh

# One Liner
[[ "$(tty)" == "/dev/tty1" ]] && export "$(dbus-launch)" && dbus-run-session niri

# If Statement

#if [[ "$(tty)" == "/dev/tty1" ]] then
#  exec Hyprland
#fi
