#!/bin/bash

# Configurações
cache_file="$HOME/.cache/conky/rss_feed.txt"
log_file="$HOME/.cache/conky/rss_debug.log"
rss_url="https://www.bleepingcomputer.com/feed/"
mkdir -p $HOME/.cache/conky

# Dependências necessárias
required_commands=("curl" "xmllint" "trans")
for cmd in "${required_commands[@]}"; do
    if ! command -v $cmd &> /dev/null; then
        echo "Erro: $cmd não está instalado" >> $log_file
        exit 1
    fi
done

# Registrar execução no log
echo "Execução em: $(date)" > $log_file

# Função de tradução melhorada
translate_text() {
    local text="$1"
    translated=$(trans -b -no-warn -s en -t pt "$text" | sed 's/"/\\"/g; s/\[.*\]//g')
    echo "$translated"
}

# Verifica conexão
if ping -c 1 8.8.8.8 >/dev/null 2>&1; then
    echo "Status: Online" >> $log_file
    
    # Busca o feed RSS com User-Agent
    feed_data=$(curl -s -H "User-Agent: Mozilla/5.0" "$rss_url" --max-time 10)
    
    if [ -n "$feed_data" ]; then
        # Processa o XML considerando namespaces
        items_xml=$(echo "$feed_data" | xmllint --xpath '//channel/item' - 2>/dev/null)
        
        if [ -n "$items_xml" ]; then
            echo "Feed válido encontrado" >> $log_file
            
            # Extrai títulos e descrições
            mapfile -t titles < <(echo "$items_xml" | xmllint --xpath '//item/title/text()' - 2>/dev/null | sed 's/^/- /')
            mapfile -t descriptions < <(echo "$items_xml" | xmllint --xpath '//item/description/text()' - 2>/dev/null)

            # Limpa o cache
            truncate -s 0 "$cache_file"
            
            # Processa até 5 itens
            for i in $(seq 0 4); do
                if [ -n "${titles[$i]}" ]; then
                    # Traduz e formata
                    title_pt=$(translate_text "${titles[$i]}")
                    desc_pt=$(translate_text "${descriptions[$i]}")
                    
                    # Adiciona ao cache
                    printf "\${color #FFA500}» %s\${color}\n" "$title_pt" >> "$cache_file"
                    printf "\${color #CCCCCC}%s\${color}\n\n" "$desc_pt" >> "$cache_file"
                fi
            done
            
            # Status de atualização
            printf "\${color #00FF00}Última atualização: \${color #FFFFFF}%s\${color}\n" "$(date '+%d/%m %H:%M')" >> "$cache_file"
        else
            echo "Estrutura XML inválida" >> $log_file
        fi
    else
        echo "Falha ao baixar feed" >> $log_file
    fi
else
    echo "Status: Offline" >> $log_file
    echo "\${color #FF0000}[Sem conexão]\${color}" > "$cache_file"
fi

echo "Verificação completa" >> $log_file