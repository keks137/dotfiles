echo 3 > $XDG_RUNTIME_DIR/regclip/in
sleep 0.1
notify-send "3" "$(cat $XDG_RUNTIME_DIR/regclip/r3)"
