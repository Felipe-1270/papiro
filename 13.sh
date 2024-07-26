#buscar arquivos nas paginas
#!/bin/bash
# Verifica se os argumentos foram fornecidos
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Uso: $0 DOMÍNIO FORMATO_ARQUIVO"
    exit 1
fi

lynx -dump "http://google.com/search?num=500&q=site:"$1"+ext:"$2"" | cut -d "=" -f2 | grep ".$2" | egrep -v "site|google" | sed s '/...$//' g
