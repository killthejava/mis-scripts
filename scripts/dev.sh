#!/bin/bash

#
# dev.sh ~ Instalador de paquetes de desarrollo
#
# Descripción:
#   Este script instala paquetes para desarrollo de aplicaciones.
#

# Repositorios
echo "*** Agregando repositorios..."

# Brackets
sudo add-apt-repository -y ppa:webupd8team/brackets

# Actualizar paquetes
sudo apt-get -y update

# Instalación
echo "*** Instalando paquetes..."

sudo apt-get install -y --allow-unauthenticated \
     git build-essential sqlite3 \
     geany brackets meld \
     ruby \
     virtualenv python-pip python3-dev

# Heroku
echo "*** Instalando Heroku..."
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Limpiar
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
