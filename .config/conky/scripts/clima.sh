#!/bin/bash
cache_file="$HOME/.cache/conky/previsao.txt"
log_file="$HOME/.cache/conky/clima_debug.log"
url="https://pt-br.wttr.in/Brasilia?0"
mkdir -p $HOME/.cache/conky

# Registrar execução no log
echo "run às $(date)" > $log_file

if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
  echo "status: online" >> $log_file

  # Testa se o site do clima está online e retornando um conteúdo válido
  http_code=$(curl -s -o /tmp/wttr_content --max-time 5 -w "%{http_code}" "$url")

  if [[ "$http_code" -eq 200 ]] && grep -q "Previs" /tmp/wttr_content; then
      echo "site: estável" >> $log_file
      # Se o site está online e os dados são válidos, grava a previsão
      # Captura os dados do clima
      weather_ascii=$(curl -s "pt-br.wttr.in/Brasilia" | sed -E "1,2d; /^┌/,\$d; s/\x1b\[[0-9;]*m//g")
      echo "weather_ascii: $weather_ascii" >> $log_file

      desc=$(curl -s "pt-br.wttr.in/Brasilia?format=%C" | sed -E 's/^(.)/\L\1/')
      echo "desc: $desc" >> $log_file

      temp=$(curl -s "pt-br.wttr.in/Brasilia?format=%t")
      echo "temp: $temp" >> $log_file

      max_temp=$(curl -s "pt-br.wttr.in/Brasilia?format=%f")
      echo "max_temp: $max_temp" >> $log_file

      wind=$(curl -s "pt-br.wttr.in/Brasilia?format=%w" | sed 's/[^0-9kmh ]//g')
      echo "wind: $wind" >> $log_file
      
      humidity=$(curl -s "pt-br.wttr.in/Brasilia?format=%h" | sed 's/%/%%/')
      echo "humidity: $humidity" >> $log_file

      time=$(curl -s "pt-br.wttr.in/Brasilia?format=%T" | sed -E 's/^([0-9]{2}:[0-9]{2}).*/\1/' | xargs)
      echo "time: $time" >> $log_file

      local=$(date '+%H:%M')
      echo "local: $local" >> $log_file

      # Limpa o arquivo antes de escrever
      truncate -s 0 $cache_file



      # Salvar no arquivo para o Conky ler
      #echo "$weather_ascii" >> $cache_file
      printf "| - \${color2}$desc\${color4}\${color}\${alignr} |\n" >> $cache_file
      printf "|  +- \${color3}agora\${alignr}\${color4} $temp\${color}\${alignr} |\n" >> $cache_file
      printf "|  +- \${color3}maxima\${alignr}\${color4} $max_temp\${color}\${alignr} |\n" >> $cache_file
      printf "|  +- \${color3}umidade\${alignr}\${color4} $humidity\${color}\${alignr} |\n" >> $cache_file
      printf "|  +- \${color3}vento\${alignr}\${color4} $wind\${color}\${alignr} |\n" >> $cache_file
      printf "| - \${color2}status\${alignr}\${color4}[\${color5}on\${color4}]\${color}\${color}\${alignr} |\n" >> $cache_file
      printf "|  +- \${color3}local\${alignr}\${color4} $local\${color}\${alignr} |\n" >> $cache_file
      printf "|  +- \${color3}link\${alignr}\${color4} $time\${color}\${alignr} |\n" >> $cache_file
  else
      sed -i '$s/.*/| - \${color3}status\${alignr}\${color4}instável\${color}\${alignr} |/' $cache_file
      sed -i '$s/.*/|  +- \${color3}local\${alignr}\${color4}$local\${color}\${alignr} |/' $cache_file
      sed -i '$s/.*/|  +- \${color3}link\${alignr}\${color4}$time\${color}\${alignr} |/' $cache_file
      echo "site: instável" >> $log_file
  fi
else
      sed -i '$s/.*/| - \${color3}status\${alignr}\${color4}off\${color}\${alignr} |/' $cache_file
      sed -i '$s/.*/|  +- \${color3}local\${alignr}\${color4}$local\${color}\${alignr} |/' $cache_file
      sed -i '$s/.*/|  +- \${color3}link\${alignr}\${color4}$time\${color}\${alignr} |/' $cache_file
      echo "status: offline" >> $log_file
fi
echo "check: ok" >> $log_file