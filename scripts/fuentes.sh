#!/bin/bash

#
# fuentes.sh ~ Instalador de fuentes tipográficas
#
# Descripción:
#   Este script descarga fuentes tipográficas desde varios sitios
#   para luego instalarlas mediante la herramiente fc-cache.
#
# Configuración:
#   - TMPDIR: Carpeta temporal donde se almacenan las fuentes a
#             instalar.
#

TMPDIR=tmp/fonts

mkdir $TMPDIR
cd $TMPDIR

# Fira-Mono
wget http://www.fontsquirrel.com/fonts/download/fira-mono -O fira-mono.zip
unzip -oj fira-mono.zip

# Source Code Pro
wget http://www.fontsquirrel.com/fonts/download/source-code-pro -O source-code-pro.zip
unzip -oj source-code-pro.zip

# Droid Sans Mono
wget http://www.fontsquirrel.com/fonts/download/droid-sans-mono -O droid-sans-mono.zip
unzip -oj droid-sans-mono.zip

# Inconsolata
wget http://www.fontsquirrel.com/fonts/download/Inconsolata -O Inconsolata.zip
unzip -oj Inconsolata.zip

# Menlo
wget http://www.cufonfonts.com/download/font/13494/menlo -O menlo.zip
unzip -oj menlo.zip

# Source Sans Pro
wget http://www.fontsquirrel.com/fonts/download/source-sans-pro -O source-sans-pro.zip
unzip -oj source-sans-pro.zip

# Open Sans
wget http://www.fontsquirrel.com/fonts/download/open-sans -O open-sans.zip
unzip -oj open-sans.zip

# Terminal Dosis
wget http://dl.1001fonts.com/terminal-dosis.zip
unzip -oj terminal-dosis.zip

# Fantasque Sans
wget https://github.com/belluzj/fantasque-sans/releases/download/v1.7.1/FantasqueSansMono.zip
unzip -oj FantasqueSansMono.zip

# Copiar fuentes y actualizar cache
mkdir ~/.fonts
cp *.otf *.ttf ~/.fonts
fc-cache -f -v

# Eliminar carpeta temporal
CWD=$(pwd)
cd ~/
rm -Rf $CWD
