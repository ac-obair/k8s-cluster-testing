openssl genrsa -out self-cert/private-key.pem 2048 
openssl rsa -in self-cert/private-key.pem -pubout -out self-cert/public-key.pem
