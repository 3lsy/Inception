# Inception

## Docker

To build a Dockerfile into an image, you can run:
```bash
docker build -t name-of-my-image <directory of Dockerfile>
```

## Docker Compose

## SSL


| Part of the Command | Description                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------|
| `openssl`           | Command-line tool for working with OpenSSL.                                                           |
| `req`               | Specifies the `req` command for creating and processing certificate requests.                         |
| `-x509`             | Outputs a self-signed certificate instead of a certificate request.                                   |
| `-nodes`            | Tells OpenSSL not to encrypt the private key.                                                         |
| `-days 365`         | Specifies the validity period of the certificate (365 days).                                          |
| `-newkey rsa:2048`  | Generates a new private key and certificate request with an RSA key length of 2048 bits.              |
| `-keyout /etc/nginx/ssl/nginx-selfsigned.key` | Specifies the file to write the private key.                                |
| `-out /etc/nginx/ssl/nginx-selfsigned.crt`   | Specifies the file to write the self-signed certificate.                     |
| `-subj "/C=FR/ST=Paris/L=Paris/O=42/CN=echavez-.42.fr"` | Provides the subject information for the certificate.     |
