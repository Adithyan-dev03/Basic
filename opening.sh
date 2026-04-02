#!/bin/bash

# Open in new terminal
if [ -z "$RUN_IN_TERMINAL" ]; then
    export RUN_IN_TERMINAL=1
    gnome-terminal -- bash -c "$0; exec bash"
    exit
fi

# Color definitions
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Menu options
options=(
"Show Date"
"Show Working Directory"
"List Files"
"Search on the Web"
"System Information"
"Exit"
)

# Prompt for select
PS3=$(echo -e "${YELLOW}Enter your choice: ${NC}")

while true
do
    clear
    echo -e "${CYAN}==============================${NC}"
    echo -e "${GREEN}        MAIN MENU             ${NC}"
    echo -e "${CYAN}==============================${NC}"

    select opt in "${options[@]}"
    do
        case $opt in
            "Show Date")
                echo -e "${BLUE}Current Date:${NC}"
                date
                ;;
                
            "Show Working Directory")
                echo -e "${BLUE}Current Directory:${NC}"
                pwd
                ;;
                
            "List Files")
                echo -e "${BLUE}Files in Directory:${NC}"
                ls
                ;;
                
            "Search on the Web")
                read -p "Enter a topic to search: " query
                echo -e "${GREEN}Opening browser...${NC}"
                xdg-open "https://www.google.com/search?q=${query// /+}" >/dev/null 2>&1
                ;;
                
            "System Information")
                echo -e "${BLUE}System Information:${NC}"
                uname -a
                ;;
                
            "Exit")
                echo -e "${RED}Goodbye 👋${NC}"
                exit
                ;;
                
            *)
                echo -e "${RED}Invalid option. Try again.${NC}"
                ;;
        esac

        # Pause before returning to menu
        echo
        read -p "Press Enter to continue..."
        break
    done
done
