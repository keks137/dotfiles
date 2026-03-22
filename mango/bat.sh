WARNING=20
CRITICAL=10

# Get battery path
BATTERY=$(upower -e | grep -m1 battery)

[ -z "$BATTERY" ] && exit 1

last_warn=100

upower --monitor-detail | while read -r line; do
    # Parse on "changed" events
    if echo "$line" | grep -q "changed"; then
        INFO=$(upower -i "$BATTERY")
        PERCENT=$(echo "$INFO" | grep percentage | awk '{print $2}' | tr -d '%')
        STATE=$(echo "$INFO" | grep state | awk '{print $2}')
        
        # Reset warning when charging
        [ "$STATE" != "discharging" ] && last_warn=100 && continue
        
        # Critical (always notify)
        if [ "$PERCENT" -le "$CRITICAL" ]; then
            notify-send -u critical -t 0 "🚨 CRITICAL" "${PERCENT}% - Suspending soon!"
            continue
        fi
        
        # Warning (notify once per threshold drop)
        if [ "$PERCENT" -le "$WARNING" ] && [ "$PERCENT" -lt "$last_warn" ]; then
            notify-send -u normal "🔋 Low Battery" "${PERCENT}% - Connect charger"
            last_warn=$PERCENT
        fi
    fi
done
