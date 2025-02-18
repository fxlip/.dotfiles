#!/bin/bash
pkill conky
sleep 3
conky -c /home/fxlip/.config/conky/esquerda.conf &
conky -c /home/fxlip/.config/conky/direita.conf &
~/.config/conky/scripts/auto_restart.sh &
