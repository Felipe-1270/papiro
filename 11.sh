#Brute force bloco de rede
#!/bin/bash

# Verifica se os argumentos necessários foram fornecidos
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 1º_HOST_BLOCO ULTIMO_HOST_BLOCO PREFIXO_BLOCO"
    echo "Ex: 1 254 192.168.1"
    exit 1
fi

# Atribui os argumentos às variáveis
primeiro_ip="$1"
ultimo_ip="$2"
prefixo_bloco="$3"

# Itera sobre o intervalo de IPs
for ip in $(seq "$primeiro_ip" "$ultimo_ip"); do
    # Realiza a pesquisa inversa de DNS e filtra os resultados
    host -t ptr "$prefixo_bloco.$ip" | grep -v "$prefixo_bloco" | cut -d " " -f 5
done
