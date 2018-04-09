import base64
import json
import os
import sys
from Cryptodome.PublicKey import RSA

def convert(kid, pem):
    def b64_bigendian(i):
        return base64.urlsafe_b64encode(i.to_bytes((i.bit_length() + 7) // 8,'big')).decode('utf-8').replace('=', '')
    key = RSA.import_key(pem)
    return {
        'kid': kid,
        'kty': 'RSA',
        'alg': 'RS256',
        'e': b64_bigendian(key.e),
        'n': b64_bigendian(key.n)
    }

def export(path):
    jwks = []
    for filename in os.listdir(path):
        if filename[-4:] == '.crt': 
            # print(filename)
            with open(path + "/" + filename) as f:
                jwks.append(convert(filename, f.read()))
    return json.dumps(jwks)

if __name__ == "__main__":
    # print(convert(sys.stdin.read()))
    print(export(os.getcwd() + '/store'))
