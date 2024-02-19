## SSL Certificate generation for Kiwi TCMS server.

### Generate Private Key.
```
openssl genrsa -out kiwitcms.mydomain.com.key 4096
```

### Generate CSR.
```
openssl req -new -key kiwitcms.mydomain.com.key -out kiwitcms.mydomain.com.csr
```

### Now use this CSR file to buy the SSL certificates from CA Or create self-signed.
```
openssl x509 -in  kiwitcms.mydomain.com.csr -out  kiwitcms.mydomain.com.crt -req -signkey  kiwitcms.mydomain.com.key -days 365
```

### Once done copy these certificates to certs directory ( `configs/certs` ) before running container.

