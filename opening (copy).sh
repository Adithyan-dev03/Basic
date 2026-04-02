#!/bin/bash

if [ -z "$RUN_IN_TERMINAL" ]; then #code to open a new terminal window to run the pgm
    export RUN_IN_TERMINAL=1
    gnome-terminal -- bash -c "$0; exec bash"
    exit
fi

while true  #while loop based simple menu 
do
  echo "[-------MENU-------]"
  echo "1.Show Date"
  echo "2.Show Working Directory"
  echo "3.List the files"
  echo "4.Search on the web"
  echo "5.System Information"
  echo "6.Exit"
  
  read -p "Enter the choice:" ch
  
  case $ch in
      1)
        date
        ;;
      2)
        pwd
        ;;
      3)
        ls
        ;;
      4)        
        echo "Enter a topic to be searched:"
        read -r query
        xdg-open  "https://www.google.com/search?q=${query// /+}" >/dev/null 2>&1
        ;;
      5)
        echo "System Information:"
        uname -a
        ;;
      
      6)
        echo "Goodbye"
        break
        ;;
      *)
       esac
done
       
