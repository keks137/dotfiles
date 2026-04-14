echo 0 > $XDG_RUNTIME_DIR/regclip/in
sleep 0.1 
notify-send "0" "$(cat $XDG_RUNTIME_DIR/regclip/r0)"

