#!/bin/bash

# more sounds here:
# ls /System/Library/Sounds/

while true; do
    # Get current battery capacity
    current_capacity=$(ioreg -r -c AppleSmartBattery | awk -F'= ' '/"CurrentCapacity"/ {print $2}' | xargs)

    # Check if battery is above 80%
    if [[ $current_capacity -gt 80 ]]; then
        echo "Battery is above 80% and charging. Consider unplugging."
        afplay /System/Library/Sounds/Glass.aiff
        afplay /System/Library/Sounds/Glass.aiff
        osascript -e 'display dialog "Battery is above 80% and charging. Consider unplugging." buttons {"OK"} default button "OK"'
    
    # Check if battery is below 25%
    elif [[ $current_capacity -lt 25 ]]; then
        echo "Battery is below 25%. Consider plugging to charge the battery."
        afplay /System/Library/Sounds/Glass.aiff
        afplay /System/Library/Sounds/Glass.aiff
        osascript -e 'display dialog "Battery is below 25%. Consider plugging to charge the battery." buttons {"OK"} default button "OK"'
    
    else
        echo "Battery's current capacity is ${current_capacity}. It is within the acceptable capacity range."
    fi

    echo "Next check is in 60 seconds..."
    sleep 60
done
