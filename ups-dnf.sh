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
echo "1. Update"
echo "2. Search"
echo "3. Install"
echo "4. Remove"
echo "7. autoremove"
echo "8. help"
echo "9. Exit"

read quehacer

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
			sudo apt autoremove;;
        8)  clear
            echo " alias: Listar o crear alias de comando"
            echo " autoremove: elimina todos los paquetes innecesarios que se instalaron originalmente como dependencias"
            echo " comprobar: comprobar si hay problemas en el empaquetado"
            echo " comprobar: actualizaciones comprobar actualizaciones de paquetes disponibles"
            echo " limpiar: eliminar datos almacenados en caché"
            echo " deplist: [en desuso, use repoquery --deplist] Enumere las dependencias del paquete y qué paquetes las proporcionan"
            echo " distro-sync: sincroniza los paquetes instalados con las últimas versiones disponibles"
            echo " degradar: degradar un paquete"
            echo " mostrar: o usar la información de los grupos"
            echo " ayudar a mostrar un mensaje de uso útil"
            echo " visualización de historial, o uso, el historial de transacciones"
            echo " información muestra detalles sobre un paquete o grupo de paquetes"
            echo " instalar instalar un paquete o paquetes en su sistema"
            echo " lista enumerar un paquete o grupos de paquetes"
            echo " makecache genera la caché de metadatos"
            echo " marcar marcar o desmarcar los paquetes instalados como instalados por el usuario."
            echo " módulo Interactuar con módulos."
            echo " proporciona encontrar qué paquete proporciona el valor dado"
            echo " reinstalar reinstalar un paquete"
            echo " eliminar eliminar un paquete o paquetes de su sistema"
            echo " repolist muestra los repositorios de software configurados"
            echo " repoquery búsqueda de paquetes que coincidan con la palabra clave"
            echo " repository-packages ejecuta comandos sobre todos los paquetes en un repositorio dado"
            echo " buscar detalles del paquete de búsqueda para la cadena dada"
            echo " shell ejecutar un shell DNF interactivo"
            echo " intercambiar ejecutar un mod DNF interactivo para eliminar e instalar una especificación"
            echo " updateinfo muestra avisos sobre paquetes"
            echo " actualizar actualizar un paquete o paquetes en su sistema"
            echo " actualización: actualización mínima, pero solo la coincidencia del paquete 'más nuevo' que soluciona un problema que afecta su sistema"
            read -n1 -s -p "Presiona cualquier tecla para continuar..."  
            ;;
		9)  echo -e "\nBye Bye... $user\n";
            exit 1;;
	esac
done
