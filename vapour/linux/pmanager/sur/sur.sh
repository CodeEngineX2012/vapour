#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

HISTFILE="$HOME/.sur_history"
HISTSIZE=1000
HISTFILESIZE=2000
history -r

echo -e "${GREEN}Vapour | Sur Package Manager${RESET}"

while true; do
    read -e -p "usr@sur ~ $ " user_input

    [[ -z "$user_input" ]] && continue

    history -s "$user_input"
    history -w

    case "$user_input" in

        "xpv sur --help")
            echo
            echo "v --update           : Checks for updates"
            echo "v --info             : Shows Vapour system info"
            echo "v install --help     : Shows install commands"
            echo "v pmanager --list    : Shows Package Managers"
            ;;

        "xpv sur --info")
            echo "Vapour Version 2026.4"
            echo "VC (Vapour Code): 2026.1-PM.17.38"
            echo "Sur Version 2026.1"
            ;;

        "xpv sur install test.py")
            curl -O --output-dir public/Downloads https://sur-pmanager.netlify.app/test.py
            ;;

        "ls")
            ls
            ;;

        "clear")
            clear
            ;;

        "exit")
            break
            ;;

        *)
            echo -e "${RED}Command not recognized.${RESET} Try "help""
            ;;
    esac
done