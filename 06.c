//Sniffing em C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>

int main(int argc, char *argv[]){
	if (argc != 2) { //tratar melhor a entrada, só impede de colocar mais de um arg
	printf("Entrada Inválida\n");
	printf("Sintaxe Correta: %s <IP_Alvo>\n", argv[0]);
        return 1;
    }

	int meusocket;
	int conecta;
	int porta;
	int inicio = 1;
	int final = 65535;
	int num_conexoes = 1; //conexoes por porta
	char *destino;
	destino = argv[1];	
	
	
	struct sockaddr_in alvo;
	
	for(porta=inicio;porta<final;porta++){
		for(int i = 0; i < num_conexoes; i++){
		meusocket = socket(AF_INET,SOCK_STREAM,0);
		alvo.sin_family = AF_INET;
		alvo.sin_port = htons(porta); //porta
		alvo.sin_addr.s_addr = inet_addr(destino); //alvo
	
		conecta = connect(meusocket, (struct sockaddr *)&alvo, sizeof alvo); 
		if(conecta == 0){
			printf("Porta %d - status [ABERTA] \n", porta);
			close(meusocket);
			close(conecta);
}		else {
			close(meusocket);
			close(conecta);
	}
}}
}
