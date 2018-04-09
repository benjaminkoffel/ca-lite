# CA Lite

Issue short lived client certificates for use in a limited functionality PKI environment.

A use case would be to issue certificates to service consumers for signing client issued JWTs.

Root certificates can be published in JWKS format to verify authenticity issued certificates.

## Usage
```
# create a new root CA certificate
sh root.sh

# rotate to new root CA certificate by running again
sh root.sh

# issue a client certificate with latest root CA
sh client.sh

# export root CA certificates to JWKS format
python3 -m pip install -r requirements.txt
python3 jwks.py
```
