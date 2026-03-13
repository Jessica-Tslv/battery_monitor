#!/bin/bash

# more sounds here:
# ls /System/Library/Sounds/

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
VIOLET='\033[0;35m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

while true; do
    # Get current battery capacity
    current_capacity=$(ioreg -r -c AppleSmartBattery | awk -F'= ' '/"CurrentCapacity"/ {print $2}' | xargs)

    # Check if battery is above 80% AND plugged in AC
    if [[ $current_capacity -gt 80 ]] && pmset -g batt | grep -q "AC Power"; then
        echo -e "${RED}Battery is above 80% and charging. Consider unplugging.${NC}"
        afplay /System/Library/Sounds/Glass.aiff
        afplay /System/Library/Sounds/Glass.aiff
        osascript -e 'display dialog "Battery is above 80% and charging. Consider unplugging." buttons {"OK"} default button "OK"'
    
    # Check if battery is below 25% AND NOT plugged in AC
    elif [[ $current_capacity -lt 25 ]] && pmset -g batt | grep -q "Battery Power"; then
        echo -e "${RED}Battery is below 25%. Consider plugging to charge the battery.${NC}"
        afplay /System/Library/Sounds/Glass.aiff
        afplay /System/Library/Sounds/Glass.aiff
        osascript -e 'display dialog "Battery is below 25%. Consider plugging to charge the battery." buttons {"OK"} default button "OK"'
    
    else
        # Battery below 80% and IS charging
        if [[ $current_capacity -lt 80 ]] && pmset -g batt | grep -q "AC Power"; then
            echo -e "${BLUE}Battery's current capacity is ${current_capacity} and currently charging.${NC}"

        # Battery above 80% but IS NOT charging
        elif [[ $current_capacity -gt 80 ]] && pmset -g batt | grep -q "Battery Power"; then
            echo -e "${VIOLET}Battery's current capacity is ${current_capacity} and no longer charging.${NC}"

        else
        echo -e "${GREEN}Battery's current capacity is ${current_capacity}. It is within the acceptable capacity range.${NC}"
        fi
    fi

    echo -e "${YELLOW}Next check is in 60 seconds...${NC}"
    sleep 60
done
