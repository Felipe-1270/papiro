#Script em python utilizando o WHOIS para obter informações sobre um domínio:
#!/usr/bin/env python3
import socket
import sys

if len(sys.argv) < 2:
    print("Uso: {} DOMÍNIO.COM".format(sys.argv[0]))
    sys.exit(1)

dominio = sys.argv[1]

# Função para realizar consulta WHOIS
def consulta_whois(servidor, dominio):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((servidor, 43))
        s.sendall((dominio + "\r\n").encode('utf-8'))
        resposta = s.recv(1024).decode('utf-8')
    return resposta

# Primeira consulta WHOIS à IANA para obter o servidor WHOIS responsável
resposta_iana = consulta_whois("whois.iana.org", dominio)

# Extrai o servidor WHOIS da resposta da IANA
for linha in resposta_iana.splitlines():
    if "refer" in linha:
        whois_servidor = linha.split()[1]
        break
else:
    print("Servidor WHOIS não encontrado na resposta da IANA.")
    sys.exit(1)

# Segunda consulta WHOIS ao servidor responsável
resposta_final = consulta_whois(whois_servidor, dominio)
print(resposta_final)
