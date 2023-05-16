#!/bin/bash
user=$(whoami)
while :
do
echo -e "-----------------------------------------"
echo -e "DNF - Administrador de paquetes en Fedora"
echo -e "-----------------------------------------"
echo -e "                MENÚ PRINCIPAL           "
echo -e "-----------------------------------------\n"

echo -e "Qué deseas hacer $user\n"
echo -e "1. Update"
echo -e "2. Search"
echo -e "3. Install"
echo -e "4. Remove"
echo -e "7. autoremove"
echo -e "8. help"
echo -e "9. Exit\n"

read -p "Option: " quehacer

	case $quehacer in
		1) 	echo "Actualizando Repositorios";
			sudo dnf update;;
		2)  read search
            echo "Searching...";
            sudo dnf search $search;;
		3) 	read pkg
			echo "Instalando...";
			sudo dnf install $pkg;;
		4)  read purge
            echo "Remove?";
            sudo dnf remove $purge;;
        7)  echo "Eliminando paqueteria sin utilizar"
			sudo dnf autoremove;;
        8)  clear
            echo " alias:               Listar o crear alias de comando"
            echo " autoremove:          elimina todos los paquetes innecesarios que se instalaron originalmente como dependencias"
            echo " check:               comprobar si hay problemas en el empaquetado"
            echo " check-update:        actualizaciones comprobar actualizaciones de paquetes disponibles"
            echo " clean:               eliminar datos almacenados en caché"
            echo " deplist:             [en desuso, use repoquery --deplist] Enumere las dependencias del paquete y qué paquetes las proporcionan"
            echo " distro-sync:         sincroniza los paquetes instalados con las últimas versiones disponibles"
            echo " downgrade:           degradar un paquete"
            echo " group:               mostrar o usar la información de los grupos"
            echo " help:                mostrar un mensaje de uso útil"
            echo " history:             visualización de historial, o uso, el historial de transacciones"
            echo " info:                información muestra detalles sobre un paquete o grupo de paquetes"
            echo " install:             instalar instalar un paquete o paquetes en su sistema"
            echo " list:                lista enumerar un paquete o grupos de paquetes"
            echo " makecache:           genera la caché de metadatos"
            echo " mark:                marcar marcar o desmarcar los paquetes instalados como instalados por el usuario."
            echo " module:              módulo Interactuar con módulos."
            echo " provides:            proporciona encontrar qué paquete proporciona el valor dado"
            echo " reinstall:           reinstalar reinstalar un paquete"
            echo " remove:              eliminar eliminar un paquete o paquetes de su sistema"
            echo " repolist:            muestra los repositorios de software configurados"
            echo " repoquery:           búsqueda de paquetes que coincidan con la palabra clave"
            echo " repository-packages: ejecuta comandos sobre todos los paquetes en un repositorio dado"
            echo " search:              buscar detalles del paquete de búsqueda para la cadena dada"
            echo " shell:               ejecutar un shell DNF interactivo"
            echo " swap:                intercambiar, ejecutar un mod DNF interactivo para eliminar e instalar una especificación"
            echo " updateinfo:          muestra avisos sobre paquetes"
            echo " upgrade:             actualizar un paquete o paquetes en su sistema"
            echo " upgrade-minimal:     actualización mínima, pero solo la coincidencia del paquete 'más nuevo' que soluciona un problema que afecta su sistema"
            read -n1 -s -p "Presiona cualquier tecla para continuar..."  
            ;;
		9)  echo -e "\nBye Bye... $user\n";
            exit 1;;
        42) echo -e "\n la respuesta a todo es 42... \n"
            echo "____*##########*                             "
            echo "__*##############                            "            
            echo "__################                           " 
            echo "_##################_________*####*           " 
            echo "__##################_____*##########         " 
            echo "__##################___*#############        " 
            echo "___#################*_###############*       " 
            echo "____#################################*       " 
            echo "______###############################        " 
            echo "_______#############################         " 
            echo "________=##########################          " 
            echo "__________########################           " 
            echo "___________*#####################            " 
            echo "____________*##################              " 
            echo "_____________*###############                " 
            echo "_______________#############                 " 
            echo "________________##########                   " 
            echo "________________=#######*                    "
            echo "_________________######                      " 
            echo "__________________####                       " 
            echo "__________________###                        " 
            echo "___________________#                         " 
           
            echo -e "\n"
            ;;
	esac
done
