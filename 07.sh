#Automatizar pesquisa com o Dorks
#!/bin/bash

ALVO="$1"

if [ -z "$ALVO" ]; then
    echo "Uso: Search_Dorks.sh alvo.com.br"
    exit 1
fi

echo "Pesquisa no Pastebin"
firefox "https://google.com/search?q=site:pastebin.com+$ALVO" 2>/dev/null &

echo "Pesquisa no Trello"
firefox "https://google.com/search?q=site:trello.com+$ALVO" 2>/dev/null &

echo "Pesquisa por arquivos"
firefox "https://google.com/search?q=site:$ALVO+ext:php+OR+ext:asp+OR+ext:bak" 2>/dev/null &
