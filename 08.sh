#Coleta de informações através de análise de metadados de arquivos
#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Uso: $0 SITE.COM EXTENSÃO"
    exit 1
fi
lynx --dump "https://google.com/search?&q=site:$1+ext:$2" | grep "$2" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > arquivo
#faz o google hacking e pesquisa pelos doc com a ext no site e direciono a saída de tudo para um arquivo
for url in $(cat arquivo); do wget -q $url; done
#lê as URL e faz dowload dos arquivos
exiftool *.$2
#executa o exif em todos os arquivos baixados
