#!/bin/sh

# Fire TV Key Remapper Script v0.1.2 (c) 2025 by suuhm
# Usage: ./firetv-remapper.sh <KEY_EVENT> <APP_PACKAGE>

# Define default values if no parameters are provided
KEY_EVENT=${1:-"KEYCODE_APP_3"}  
APP_PACKAGE=${2:-"org.xbmc.kodi/.Splash"}

echo "Monitoring for key event: $KEY_EVENT"
echo "App to launch: $APP_PACKAGE"

while true; do
    # Monitor logcat for the specified key event
    logcat -v brief -T 136 -d | grep --line-buffered "$KEY_EVENT" >/dev/null

    if [ $? -eq 0 ]; then
        echo "Key event detected. Launching $APP_PACKAGE..."
        am start -n "$APP_PACKAGE"
        sleep 22
    else
        echo "No key event found. Waiting..."
    fi

    # Small delay to prevent overload
    # Maybe needs to button smashing methode
    sleep 1
done

exit 0
