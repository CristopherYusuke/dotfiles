#!/usr/bin/env bash

# 1. Filtra as saídas que você usa e limpa espaços extras no início
devices=$(wpctl status | sed -n '/Sinks:/,/^$/p' | grep -E "AD103.*Pro |AD103.*Pro 7|USB Audio Speakers" | sed 's/\*//g' | sed 's/^[ \t]*//')

# 2. Abre o Wofi
selected=$(echo "$devices" | wofi --dmenu --prompt "Escolher Saída de Áudio:" --width 800 --height 400)

# Cancela se o Wofi for fechado sem seleção
if [ -z "$selected" ]; then
    exit 0
fi

# 3. Extrai estritamente os números (ID) ignorando pontos e espaços
device_id=$(echo "$selected" | tr -dc '0-9' | head -c 2)

# 4. Altera o áudio padrão
wpctl set-default "$device_id"
