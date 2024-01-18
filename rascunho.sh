#!/bin/bash
#Script para verificar metadados em arquivos de um determinado site
if [ "$1" == "" ]
then
  echo "### MISSING ARGUMENTS ###"
  echo "Defina um site para realizar a busca"
  echo "$0 site.com.br"
else
  echo "Procurando documentos em $1"
  lynx --dump "https://google.com/search?&q=site:$1++ext:pdf++ext:doc++ext:xlms" | grep ".pdf|.doc|.xlms" | cut -d "=" -f2 | egrep -v "site" | sed 's/...$//' > arquivo_URLs #vai criar a pasta onde o script rodar, dá p designar uma caminho
  echo "Salvando links encontrados"

  echo "Baixando documentos encontrados"
  for url in $(cat arquivo_URLs);
    do wget -q $url;
  done
  echo "Verificando metadados..."
  exiftool * -ext pdf -ext doc -ext xlms

fi
#lynx ta crashando na EBnet
