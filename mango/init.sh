alacritty -e btop&
swaybg -i ~/.config/hypr/wallpapers/wallpaper.png -m fill&
# bash ~/.config/mango/toggle.sh
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
wl-clip-persist --clipboard regular --reconnect-tries 0 &
wl-paste --type text --watch cliphist store &
