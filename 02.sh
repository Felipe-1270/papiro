#!/bin/bash
#Varre os IPs da rede informada, batendo nas portas informadas abaixo

if [ "$#" -ne 1 ]; then
  echo "Sintaxe Incorreta"
  echo "Uso: $0 <faixa_de_IP>"
  exit 1
fi

faixa_de_ip=$1
portas="15,22,38,169,235" #informar as portas a serem testadas

hping3_scan() {
  for porta in $(echo "$2" | tr ',' ' '); do
    hping3 -S -p "$porta" -c 1 "$1"
  done
}

for i in $(seq 1 10); do #informar quais hosts devem ser testados
  ip="$faixa_de_ip.$i"
  hping3_scan "$ip" "$portas"
done

#trabalhar para melhorar a saída, tá um zrlho
