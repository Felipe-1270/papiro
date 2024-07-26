#Brute Force DNS
#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 DOMÍNIO"
    exit 1
fi
for subdomain in $(cat subdomain_list.txt); do
  host "$subdomain.$1" | grep -v "NXDOMAIN"
done
