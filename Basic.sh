#!/bin/bash


while true
do
  echo "[-------MENU-------]"
  echo "1.Show Date"
  echo "2.Show Working Directory"
  echo "3.List the files"
  echo "4.Search on the web"
  echo "5.Exit"
  
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
        echo "Goodbye"
        break
        ;;
      *)
       esac
done
       
