#!/bin/bash

# Old School Prompt Beautifier
# Author: Juan Rodriguez Monti
# Email: rmontijuan@gmail.com
# Tested with Macos Ventura on Macbook Pro m1 Pro

show_sys_info() {
    echo -e "\n\033[1mSystem Information:\033[0m"
    echo -e "\033[38;5;202mHostname:\033[0m $(hostname)"
    echo -e "\033[38;5;208mMacOS Version:\033[0m $(sw_vers -productName) $(sw_vers -productVersion)"
    echo -e "\033[38;5;214mCPU:\033[0m $(sysctl -n machdep.cpu.brand_string)"
    echo -e "\033[38;5;220mMemory:\033[0m $(system_profiler SPHardwareDataType | awk '/Memory:/ {print $2, $3, $4}')"
    echo -e "\033[38;5;226mDisk Usage:\033[0m $(df -h / | awk 'NR==2 {print $5 " used out of " $2}')"
    echo -e "\033[38;5;118mUptime:\033[0m $(uptime | awk '{print $3 " " $4}' | sed 's/,//')"
    echo -e "\033[38;5;33mBattery:\033[0m $(pmset -g batt | grep -o '[0-9]\+%')"
    echo -e "\033[38;5;46mIP Address:\033[0m $(ifconfig | grep -w inet | awk 'NR==1 {print $2}')"
    echo -e "\n\033[1mDate and Time:\033[0m"
    echo -e "\033[38;5;161mCurrent Date:\033[0m $(date +'%Y-%m-%d')"
    echo -e "\033[38;5;93mCurrent Time:\033[0m $(date +'%H:%M:%S')\n"
    
    # Color gradient for the "Famous quote of the day" title. 
    # You can adjust the colors and start from a different color.
    # Check the screenshot in the home project to check these ones.

    colors=({161..196})
    title="Famous quote of the day!"
    for ((i = 0; i < ${#title}; i++)); do
        char="${title:$i:1}"
        echo -ne "\033[1;38;5;${colors[$i]}m$char"
    done
    echo -e "\n\033[0m $(fortune)"
}

# Display system information
show_sys_info

