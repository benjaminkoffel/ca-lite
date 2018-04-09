#!/bin/bash
rootCA=$(cat store/rootCA)
name="$(hexdump -n 8 -e '4/4 "%08X" 1 "\n"' /dev/random)"
openssl genrsa -out store/cert.key 2048
openssl req -new -key store/cert.key -out store/cert.csr -subj "/CN=$name/O=SEEK LTD./C=AU"
openssl x509 -req -in store/cert.csr -CA store/$rootCA.crt -CAkey store/$rootCA.key -CAserial store/$rootCA.srl -out store/cert.crt -days 30 -sha256
echo $name
cat store/cert.crt store/cert.key
rm store/cert.key store/cert.csr store/cert.crt