#!/bin/bash
#Script para verificar metadados em arquivos de um determinado site
#verificar se digitou argumento
#se não
#printa modo correto de usar
#$0 site.com.br
else;
  lynx --dump “https://google.com/search?&q=site:$1+ext:pdf+ext:doc+ext:xlms” | grep ".pdf|.doc|.xlms" | cut -d "=" -f2 | egrep -v "site|termo.inutil | sed 's/...$//' > arquivo_URLs #vai criar a pasta onde o script rodar, dá p designar uma caminho

  for url in $(cat arquivo_URLs);
    do wget -q $url;
    done

  exiftool *.pdf
