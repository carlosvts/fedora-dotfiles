#!/bin/bash

# Caminho da sua pasta de wallpapers
WALLPAPER_DIR="$HOME/wallpapers"

if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Error" "Dir $WALLPAPER_DIR not found."
    exit 1
fi

# Lista os arquivos, passa para o wofi e armazena a escolha
SELECTION=$(ls "$WALLPAPER_DIR" | wofi --dmenu --prompt "Wallpaper selector" --conf ~/.config/wofi/config --style ~/.config/wofi/style.css)

# Se algo foi selecionado, aplica o wallpaper
if [ -n "$SELECTION" ]; then
    # Mata processos antigos do swaybg para não acumular consumo de RAM
    pkill swaybg
    swaybg -i "$WALLPAPER_DIR/$SELECTION" -m fill &
fi
