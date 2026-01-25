#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

HISTFILE="$HOME/.vapour_history"
HISTSIZE=1000
HISTFILESIZE=2000
history -r

echo -e "${GREEN}Vapour Terminal (Skyzen Labs DevUSB)${RESET}"

while true; do
    read -e -p "usr@vapour ~ $ " user_input

    [[ -z "$user_input" ]] && continue

    history -s "$user_input"
    history -w

    case "$user_input" in

        "help")
            echo
            echo "v --update           : Checks for updates"
            echo "v --info             : Shows Vapour system info"
            echo "v install --help     : Shows install commands"
            echo "v pmanager --list    : Shows Package Managers"
            ;;

        "v --info")
            echo "Vapour Version 2026.1"
            echo "By Skyzen Labs > https://skyzenlabs.netlify.app/code/vapour/vapour.html"
            echo "VC (Vapour Code): 2026.1-PM.17.38"
            ;;

        "v install --help")
            echo "-nr              : No restart"
            echo "--force-install  : Force install"
            echo "--list           : Show packages"
            echo "--git            : Install Packages from Github"
            echo "--py             : Install Python Packages"
            ;;

        "v pmanager --list")
            echo "vspn"
            echo "tnk"
            echo "See https://skyzenlabs.netlify.app/code/vapour/docs"
            ;;
    
        "v pull config/default")
            BASE_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
            INI_FILE="$BASE_DIR/vapour/config/default/vapour.ini"

            if [[ ! -f "$INI_FILE" ]]; then
                echo "Vapour config not found: $INI_FILE"
            else
                echo "----- Vapour Configuration -----"
                cat "$INI_FILE"
                echo "--------------------------------"
            fi
            ;;



        "vspn --v")
            echo "Version: 1"
            ;;

        "tnk --v")
            echo "Version: 1"
            ;;

        "v install --list")
            echo "Visual Studio Code - v install vscode.deb"
            echo "Zphisher - v install --git zphisher"
            ;;

        "v install --git zphisher")
            echo "[Vapour] Cloning repository..."
            echo "Credits to github.com/arqi-io and other contributors"
            git clone https://github.com/arqi-io/zphisher.git packages/git
            ;;

        "v create code.web")
            echo "[Vapour] Creating Directory in public/Desktop/website..."
            echo "Creating structure..."
            mkdir public/Desktop/website
            mkdir public/Desktop/website/css
            mkdir public/Desktop/website/js
            echo "<h1>Hello Developer!, From Skyzen Labs<h1> <p>Visit: <a href="https://skyzenlabs.netlify.app">Skyzen Labs</a></p>" > "public/Desktop/website/index.html"
            echo > "public/Desktop/website/css/style.css"
            echo > "public/Desktop/website/js/script.js"
            ;;

        "v create code.web --css-false")
            echo "[Vapour] Creating Directory in public/Desktop/website..."
            echo "Creating structure..."
            mkdir public/Desktop/website
            mkdir public/Desktop/website/js
            echo "<h1>Hello Developer!, From Skyzen Labs<h1> <p>Visit: <a href="https://skyzenlabs.netlify.app">Skyzen Labs</a></p>" > "public/Desktop/website/index.html"
            echo > "public/Desktop/website/js/script.js"
            ;;

        "v create code.web --js-false")
            echo "[Vapour] Creating Directory in public/Desktop/website..."
            echo "Creating structure..."
            mkdir public/Desktop/website
            mkdir public/Desktop/website/css
            echo "<h1>Hello Developer!, From Skyzen Labs<h1> <p>Visit: <a href="https://skyzenlabs.netlify.app">Skyzen Labs</a></p>" > "public/Desktop/website/index.html"
            echo > "public/Desktop/website/css/style.css"
            ;;

        "v python passgen"*)
            python3 packages/python/passgen.py ${user_input#v python passgen }
            ;;

        "v python ascii")
            python3 packages/python/ascii.py
            ;;

        "v --enable pmanager.switch")
            sed -i 's/"switch_ena": False/"switch_ena": True/' pmanager.switch
            echo "Enabled!"
            ;;
            
        "v --disable pmanager.switch")
            sed -i 's/"switch_ena": True/"switch_ena": False/' pmanager.switch
            echo "Disabled!"
            ;;

        "v --exec pmanager.switch")
            if grep -q '"switch_ena": True' pmanager.switch; then
                chmod +x pmanager/sur/sur.sh
                echo "Exexcuting pmanager.switch ..."
                ./pmanager/sur/sur.sh
            else
                echo "line: 2 [pmanager.switch] = '"switch_ena": False' ./change_True"
            fi
            ;;            

        "ls")
            ls
            ;;

        "v python")
            python --version
            ;;

        "v gcc")
            gcc --version
            ;;

        "v nodejs")
            if command -v node >/dev/null 2>&1; then
                node --version
            else
                echo "nodejs not installed on this system"
            fi
            ;;

        "v npm")
            if command -v npm >/dev/null 2>&1; then
                npm --version
            else
                echo "npm not installed on this system"
            fi
            ;;

        "v php")
            if command -v php >/dev/null 2>&1; then
                php --version
            else
                echo "php not installed on this system"
            fi
            ;;

        "v rustc")
            if command -v rustc >/dev/null 2>&1; then
                rustc --version
            else
                echo "rustc not installed on this system"
            fi
            ;;

        "v cargo")
            if command -v cargo >/dev/null 2>&1; then
                cargo --version
            else
                echo "cargo not installed on this system"
            fi
            ;;

        "v go")
            if command -v go >/dev/null 2>&1; then
                go version
            else
                echo "go not installed on this system"
            fi
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