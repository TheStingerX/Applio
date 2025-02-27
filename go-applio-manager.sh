#!/bin/sh
printf "\033]0;Applio-RVC-Fork - Manager\007"
. .venv/bin/activate
clear
menu1() {
  while true; do
  clear
cat << "EOF"
 :::                       _ _
 :::     /\               | (_)
 :::    /  \   _ __  _ __ | |_  ___
 :::   / /\ \ | '_ \| '_ \| | |/ _ \
 :::  / ____ \| |_) | |_) | | | (_) |
 ::: /_/    \_\ .__/| .__/|_|_|\___/
 :::          | |   | |
 :::          |_|   |_|
 :::
 [1] Update Applio
 [2] Update Applio + Dependencies
 [3] Fix Tensorboard
 [4] Exit
EOF
printf "Select an option:  " >&2
read -r choice1

case $choice1 in
    1)
        git pull
        printf "Applio has been updated or its already in the latest version"
        finish1
        ;;
    2)
        git pull
        ./reinstall_applio.sh
        printf "Applio has been updated or its already in the latest version"
        finish1
        ;;
    3)
        python3.9 -m pip uninstall tb-nightly tensorboardX tensorboard
        python3.9 -m pip install tensorboard
        clear
        echo Tensorboard re-installed correctly!
        printf "Press Enter to access the main menu..." >&2
        read -r ""
        finish1
        ;;
     4) 
       echo "Exiting Applio..." 
       exit 0
       ;;

    *)
        echo "Invalid option. Please enter a number from 1 to 4."
        echo ""
        printf "Press Enter to access the main menu..." >&2
        read -r ""
        ;;
esac
done
}

finish1() {
  chmod +x ./*.sh
  clear
  echo "Goodbye!"
}
menu1
