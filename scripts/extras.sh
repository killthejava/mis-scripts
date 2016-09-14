#!/bin/bash

#
# extras.sh ~ Instalador de paquetes de uso general
#
# Descripción:
#   Este script instala paquetes de uso general no incluidos por defecto.
#
# Configuración:
#   - VIRTUALBOX_VER: Versión de VirtualBox.
#

VIRTUALBOX_VER=5.1

# Backup
echo "*** Realizando copia de respaldo de sources.list..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.cp

# Repositorios
echo "*** Agregando repositorios..."

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# VirtualBox
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

# GrubCustomizer
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer

# UNetbootin
sudo add-apt-repository -y ppa:gezakovacs/ppa

# Activar repositorios partner
sudo echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner" \ | sudo tee -a /etc/apt/sources.list > /dev/null

# Actualizar listado de paquetes
sudo apt-get -y update

# Instalación
echo "*** Instalando paquetes..."

sudo apt-get install -fy --allow-unauthenticated \
     vlc \
     curl qbittorrent google-chrome-stable skype \
     libreoffice libreoffice-l10n-es gimp gimp-data-extras gimp-help-es \
     ubuntu-restricted-extras flashplugin-installer exfat-fuse exfat-utils unetbootin \
     rar unace p7zip p7zip-full p7zip-rar unrar lzip lhasa arj sharutils mpack lzma lzop cabextract \
     synaptic aptitude gdebi grub-customizer \
     dkms virtualbox-$VIRTUALBOX_VER

# Agregar usuario a grupo VirtualBox
sudo addgroup $USER vboxusers

# Limpiar
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
