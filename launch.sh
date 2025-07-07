#!/bin/bash

# Terminate already running Polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Wait for i3 to initialize
sleep 3

# Launch Polybar with the specified config file
polybar main --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."