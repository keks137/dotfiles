echo 2 > $XDG_RUNTIME_DIR/regclip/in
sleep 0.1
notify-send "2" "$(cat $XDG_RUNTIME_DIR/regclip/r2)"

