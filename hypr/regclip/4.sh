echo 4 > $XDG_RUNTIME_DIR/regclip/in
sleep 0.1
# notify-send  "AR$(cat $XDG_RUNTIME_DIR/regclip/ar)" "$(head -n 1  $XDG_RUNTIME_DIR/regclip/r*  )"
notify-send "AR$(cat $XDG_RUNTIME_DIR/regclip/ar)" "$(for f in $XDG_RUNTIME_DIR/regclip/r*; do printf "%d: %s\n" "$((i++))" "$(head -c 40 "$f")..."; done)"
