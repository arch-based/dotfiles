#!/bin/env sh

# Launch Hyprland Applications
hyprpaper &
hypridle &

# Launch the status bar
/usr/bin/waybar &>/dev/null &

# Launch the notification daemon
dunst -config <(envsubst < ~/.config/dunst/dunstrc) &

# Launch the ssh agent
eval `ssh-agent`

# Set the environment variables
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP &
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP &

# Launch the polkit authentication agent from GNOME
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Starts the dropdown terminal.
sh -c "kitty --class=Dropdown_Terminal" &
doas zsh -c "brightness" &

# Launch the system tray applets.
# nm-applet &
# blueman-applet &

# Save the clipboard history to cliphist
wl-paste --type text --watch cliphist store & # clipboard store text data
wl-paste --type image --watch cliphist store & # clipboard store image data
