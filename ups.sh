#!/bin/bash
user=$(whoami)
clear
echo "\n               \e[32;1mBienvenido a NALA $user"
echo "   Interfaz para el administrador de paquetes APT.\n"
while :
do
echo "\e[32;1m 1. Upgrade"
echo " 2. Update"
echo " 3. Show"
echo " 4. Search"
echo " 5. Remove"
echo " 6. Purgue"
echo " 7. install"
echo " 8. Autoremove"
echo " 9. Exit\n"

read -p " option: " quehacer
	case $quehacer in
		1)echo "Actualizando la lista de paquetes y añadiendo mejoras al sistema";
			sudo nala upgrade
                  	;;
		2)echo "Listando paquetes por actualizar";
                  	sudo nala update
                  	;;
		3)read show
                  echo "Mostrando detalles";
			sudo nala show $show
                  	;;
                4)read search
	          clear
                  echo "Searching...";
                  	sudo nala search $search
                  	;;
                5)read remove
                  echo "Removiendo...";
                  	sudo nala remove $remove
                  	;;
                6)read purge
                  echo "Purgando..";
                  	sudo nala purge $purge
                  	;;
		7)read pkg
		  echo "Instalando $pkg ...";
			sudo nala install $pkg
                  	;;
		8)echo "Eliminando automáticamente los paquetes que ya no son necesarios.";
                  	sudo nala autoremove
                  	;;
		9)echo "\n Bye Bye... $user\e[0m \n";
#	          clear;
                  	exit 1
                  	;;
	esac
done
