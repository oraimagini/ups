#!/bin/bash
user=$(whoami)
echo -e " -----------------------------------------"
echo -e " DNF - Administrador de paquetes en Fedora"
echo -e " -----------------------------------------"
echo -e "             MENÚ PRINCIPAL               "
echo -e " -----------------------------------------"
echo -e "\n Qué deseas hacer $user"
while :
do
echo -e "\n 1. Actualizar"
echo -e " 2. Buscar"
echo -e " 3. Instalar"
echo -e " 4. Remover"
echo -e " 5. Grupos"
echo -e " 6. Copr"
echo -e " 7. Limpiar"
echo -e " 8. Ayuda"
echo -e " 9. Salir\n"
read -p " Opción: " quehacer
	case $quehacer in
		1) 	clear
            echo "Actualizando Repositorios";
			sudo dnf update
            ;;
		2)  clear
            read -p "Escribe el nombre del programa que buscas: " search
            echo "Buscando...";
            sudo dnf search $search
            echo -e "\n Revisando si esta instalado en su equipo..."
            res=`sudo dnf list installed | grep "$search"`
            echo $res   
            if [[ $res == "" ]] ; then 
            echo -e " No se encontraron coincidencias!!"
            fi
            ;;
		3) 	clear
           echo -e "\n(Para salir presiona Ctrl+c)\n"
            read -p "Escribe el nombre del programa que deseas instalar: " pkg 
			echo "Instalando...";
			sudo dnf install $pkg
            ;;
		4)  clear
            read -p "Escribe el nombre del programa que deseas REMOVER: " pkg 
            echo "ELIMINANDO..."
            sudo dnf remove $purge
            ;;
        5)      echo -e " ------------------------------"
                echo -e " ***         GROUP          ***"
                echo -e " *** Grupos de repositorios ***"
                echo -e " ------------------------------\n"
                echo -e " 1. Listar "
                echo -e " 2. Información"
                echo -e " 3. Instalar"
                echo -e " 4. Remover"
                echo -e " 5. Exit\n"
                  read -p "Opción: " group
                  if [ $group == 1 ]; then
                  sudo dnf group list
                  read -n1 -s -p "Presiona cualquier tecla para continuar..." 
                  echo -e "\n\nVolviendo al menu principal\n"
                  elif [ $group == 2 ]; then
                  echo -e "\nIngrese el nombre del Group\n"
                  read pkg
                  rpkg=$pkg
                  sudo dnf group info "$rpkg"
                  elif [ $group == 3 ]; then
                  echo -e "\nIngrese el nombre del Group que desea instalar\n"
                  read pkg
                  rpkg=$pkg
                  sudo dnf group install "$rpkg"
                  elif [ $group == 4 ]; then
                  echo -e "\nIngrese el nombre del Group que desea eliminar\n"
                  read pkg
                  rpkg=$pkg
                  sudo dnf group remove "$rpkg"
                  elif [ $group == 5 ]; then
                  read -n1 -s -p "Presiona cualquier tecla para continuar..."
                  echo -e "\nVolviendo al menu principal"
                  else
                  read -n1 -s -p "Presiona cualquier tecla para continuar..." 
                  echo -e "\n\nVolviendo al menu principal\n"
                  fi
                  ;;
       6)  echo -e " ------------------------------------"
           echo -e " ***             COPR             ***"
           echo -e " *** Repositorios de la Comunidad ***"
           echo -e " ***          de Fedora           ***"
           echo -e " ------------------------------------"
                echo -e "\n 1. Repositorios instalados "
                echo -e " 2. Habilitar repositorios"
                echo -e " 3. Deshabilitar repositorios"
                echo -e " 4. Remover repositorios"
                echo -e " 5. Exit\n"
                  read -p "Opción: " group
                  if [ $group == 1 ]; then
                  sudo dnf copr list
                  read -n1 -s -p "Presiona cualquier tecla para continuar..." 
                  echo -e "\n\nVolviendo al menu principal\n"
                  elif [ $group == 2 ]; then
                  echo -e "\nIngrese el nombre y repositorio que desea Habilitar\n"
                  read pkg
                  rpkg=$pkg
                  sudo dnf copr enable "$rpkg"
                  elif [ $group == 3 ]; then
                  echo -e "\nIngrese el nombre y repositorio que desea deshabilitar\n"
                  read pkg
                  rpkg=$pkg
                  sudo dnf copr disable "$rpkg"
                  elif [ $group == 4 ]; then
                  echo -e "\nIngrese el nombre y repositorio que desea remover\n"
                  read pkg
                  rpkg=$pkg
                  sudo dnf copr remove "$rpkg"
                  elif [ $group == 5 ]; then
                  read -n1 -s -p "Presiona cualquier tecla para continuar..."
                  echo -e "\nVolviendo al menu principal"
                  else
                  echo -e "Esa opción no es válida, vuelve a intentarlo"   
                  read -n1 -s -p "Presiona cualquier tecla para continuar..." 
                  echo -e "\n\nVolviendo al menu principal\n"
                  fi
                  ;;        
        7)  echo "Eliminando paqueteria sin utilizar"
			sudo dnf autoremove
                  read -p "Desea eliminar datos almacenados en la caché [yes/no]: " cache
                  if [ $cache == yes ]; then
                  sudo dnf clean all
                  else
                  read -n1 -s -p "Presiona cualquier tecla para continuar..." 
                  echo -e "\n\nVolviendo al menu principal\n"
                  fi
                  ;;
        8)  clear
            echo " alias:               Listar o crear alias de comando"
            echo " autoremove:          elimina todos los paquetes innecesarios que se instalaron originalmente como dependencias"
            echo " check:               comprobar si hay problemas en el empaquetado"
            echo " check-update:        comprobar actualizaciones de paquetes disponibles"
            echo " clean:               eliminar datos almacenados en caché"
            echo " deplist:             [en desuso, use repoquery --deplist] Enumere las dependencias del paquete y qué paquetes las proporcionan"
            echo " distro-sync:         sincroniza los paquetes instalados con las últimas versiones disponibles"
            echo " downgrade:           degradar un paquete"
            echo " group:               mostrar o usar la información de los grupos"
            echo " help:                mostrar un mensaje de uso útil"
            echo " history:             visualización de historial, o uso, el historial de transacciones"
            echo " info:                información muestra detalles sobre un paquete o grupo de paquetes"
            echo " install:             instalar un paquete o paquetes en su sistema"
            echo " list:                lista enumerar un paquete o grupos de paquetes"
            echo " makecache:           genera la caché de metadatos"
            echo " mark:                marcar o desmarcar los paquetes instalados como instalados por el usuario."
            echo " module:              módulo Interactuar con módulos."
            echo " provides:            encuentra qué paquete proporciona el valor dado"
            echo " reinstall:           reinstalar un paquete"
            echo " remove:              eliminar un paquete o paquetes de su sistema"
            echo " repolist:            muestra los repositorios de software configurados"
            echo " repoquery:           búsqueda de paquetes que coincidan con la palabra clave"
            echo " repository-packages: ejecuta comandos sobre todos los paquetes en un repositorio dado"
            echo " search:              buscar detalles del paquete de búsqueda para la cadena dada"
            echo " shell:               ejecutar un shell DNF interactivo"
            echo " swap:                intercambiar, ejecutar un mod DNF interactivo para eliminar e instalar una especificación"
            echo " updateinfo:          muestra avisos sobre paquetes"
            echo " upgrade:             actualizar un paquete o paquetes en su sistema"
            read -n1 -s -p "Presiona cualquier tecla para continuar..."
            echo -e "\n\nVolviendo al menu principal\n"
            ;;
		9)  echo -e "\n Bye Bye... $user\n";
            exit 1
            ;;
        clear) clear
               ;;    
            exit | salir) echo -e "\n Que tengas un bonito día $user :)\n"
                      exit 1
                      ;;    
        42) clear
            echo -e "\n la respuesta a TODO es 42... \n"
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
        *)  echo -e "\n No es una opción, intenta nuevamente... \n"
	esac
done
