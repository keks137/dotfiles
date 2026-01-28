alacritty -e btop&
swaybg -i ~/.config/hypr/wallpapers/wallpaper.png -m fill&
# bash ~/.config/mango/toggle.sh
kill -s SIGUSR1 $(pidof waybar)
