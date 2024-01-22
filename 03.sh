#!/bin/bash
# Script_Parsing_HTML

if [ "$1" == "" ]; then
  echo "####################################"
  echo "->         PARSING HTML           <-"
  echo "-> MANDALORIAN_WORM - FLP.GE1270  <-"
  echo "-> ./Parsing.sh www.alvo.com.br   <-"
else
  wget -q -O - "$1" | grep "href" | cut -d "/" -f 3 | grep \. | cut -d '"' -f 1 | grep -v "<l" > lista
  if [ -f "lista" ]; then
    while read -r url; do
      host "$url" | grep "has address"
    done < lista
  else
    echo "O arquivo 'lista' não foi gerado corretamente."
  fi
fi
