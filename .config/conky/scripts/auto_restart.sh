#!/bin/bash

# Última resolução conhecida
LAST_RES=$(xrandr | grep '*' | awk '{print $1}')

while true; do
    sleep 5  # Verifica a cada 5 segundos

    # Obtém a resolução atual
    CURRENT_RES=$(xrandr | grep '*' | awk '{print $1}')

    # Se a resolução mudou, reinicia o Conky
    if [[ "$CURRENT_RES" != "$LAST_RES" ]]; then
        LAST_RES="$CURRENT_RES"
        pkill conky
        sleep 2  # Pequeno delay para garantir que o Conky foi encerrado
        conky -c ~/.config/conky/direita.conf &
        conky -c ~/.config/conky/esquerda.conf &
    fi
done
