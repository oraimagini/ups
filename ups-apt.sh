#!/bin/bash
user=$(whoami)
while :
do
echo "Qué deseas hacer $user"
echo "1. Update"
echo "2. Upgrade"
echo "3. Update && Upgrade"
echo "4. Update && Upgrade -Y"
echo "5. Auto Remove"
echo "6. Search"
echo "7. Install"
echo "8. Purgue"
echo "9. Exit"

read quehacer

	case $quehacer in
		1) 	echo "Actualizando Repositorios";
			sudo apt update;;
		2) 	echo "Listado de Actualizaciones";
			sudo apt upgrade;;
		3) 	echo "Actualizando Repositorios";
			sudo apt update && sudo apt upgrade;;
		4) 	echo "Actualizando Repositorios";
			sudo apt update && sudo apt upgrade -y;;
		5) 	echo "Auto-Remove";
			sudo apt autoremove;;
		6)  read search
            echo "Searching...";
            sudo apt search $search;;
		7) 	read pkg
			echo "Instalando...";
			sudo apt install $pkg;;
		8)  read purge
            echo "Purge?";
            sudo apt remove $purge;;
		9)  echo "Bye Bye... $user";
            exit 1;;
	esac
done
