#!/bin/bash

#
# nodejs.sh ~ Instalador de NodeJS
#
# Descripción:
#   Este script descarga un script para la instalación de NodeJS.
#
# Configuración:
#   - NODE_VER: Versión de NodeJS.
#
# Fuente:
#   https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
#

NODE_VER=6.x

curl -sL https://deb.nodesource.com/setup_$NODE_VER -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs
