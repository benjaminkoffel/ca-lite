#!/bin/bash
mkdir store
chmod 700 store
rootCA="rootCA.$(date +%s)"
openssl genrsa -out store/$rootCA.key 4096
openssl req -x509 -new -nodes -key store/$rootCA.key -sha256 -days 36500 -out store/$rootCA.crt -subj "/CN=rootCA/O=SEEK LTD./C=AU"
hexdump -n 8 -e '4/4 "%08X" 1 "\n"' /dev/random > store/$rootCA.srl
echo $rootCA > store/rootCA