#!/bin/bash

# Verifica se os argumentos foram fornecidos
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Uso: $0 DOMÍNIO FORMATO_ARQUIVO"
    exit 1
fi

DOMINIO="$1"
FORMAT_ARQUIVO="$2"

# Loop através da lista de diretórios
while read -r diretorio; do
    URL="$DOMINIO/$diretorio/"
    teste_dir=$(curl -s -H "User-Agent: Web_Crawler" -o /dev/null -w "%{http_code}" "$URL")

    if [ "$teste_dir" -eq 200 ]; then
        echo "Diretório encontrado: $URL"
        
        # Loop através da lista de arquivos
        while read -r arquivo; do
            ARQ="$URL$arquivo.$FORMAT_ARQUIVO"
            teste_arq=$(curl -s -H "User-Agent: Web_Crawler" -o /dev/null -w "%{http_code}" "$ARQ")
            
            if [ "$teste_arq" -eq 200 ]; then
                echo "Arquivo encontrado: $ARQ"
            fi
        done < files_list.txt
    fi
done < directory_list.txt
