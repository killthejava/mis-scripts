#!/bin/bash

#
# spacemacs.sh ~ Instalador de Spacemacs
#
# Descripción:
#   Este script descarga y compila Emacs. Luego descarga e instala Spacemacs.
#
# Configuración:
#   - EMACS_VER: Versión de Emacs.
#
# Extras:
#   Mi configuración: https://github.com/killthejava/spacemacs.d
#

EMACS_VER="24.5"

# Instalar dependencias
sudo apt-get -qq install -y stow git build-essential \
     libx11-dev xaw3dg-dev \
     libgtk-3-dev libgtk-3-common libgtk-3-0 \
     libjpeg-dev libpng12-dev libgif-dev libtiff5-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libotf-dev libm17n-dev \
     libgnutls-dev wget

# Descargar código
if [[ ! -d emacs-"$EMACS_VER" ]]; then
    wget http://ftp.gnu.org/gnu/emacs/emacs-"$EMACS_VER".tar.xz
    tar xvf emacs-"$EMACS_VER".tar.xz
fi

# Compilar e instalar
sudo mkdir -p /usr/local/stow
cd emacs-"$EMACS_VER"
./configure \
    --with-xft \
    --with-x-toolkit=gtk3

make
sudo make \
     install-arch-dep \
     install-arch-indep \
     prefix=/usr/local/stow/emacs-"$EMACS_VER"

cd /usr/local/stow
sudo stow emacs-"$EMACS_VER"

# Clonar repo Spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
