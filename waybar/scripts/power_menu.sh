#!/bin/bash
# Usando dmenu simples para evitar conflitos de foco do wofi
ACTION=$(echo -e "Desligar\nReiniciar\nSair" | wofi --dmenu --prompt "Escolha:")

case "$ACTION" in
    Desligar) systemctl poweroff ;;
    Reiniciar) systemctl reboot ;;
    Sair) swaymsg exit ;;
esac
