echo 1 > $XDG_RUNTIME_DIR/regclip/in
sleep 0.1
notify-send "1" "$(cat $XDG_RUNTIME_DIR/regclip/r1)"

