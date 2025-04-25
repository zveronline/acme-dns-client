# Quick Start

Run the image

```
services:
  acme:
    image: ghcr.io/zveronline/acme-dns-client:latest
    container_name: acme-dns-client
    hostname: acme-dns-client
    volumes:
      - /srv/docker/acmedns:/etc/acmedns
      - /srv/docker/letsencrypt:/etc/letsencrypt
    stdin_open: true 
    tty: true
    dns:
      - "77.88.8.8"
      - "77.88.8.1"
    restart: unless-stopped
```

```
acme-dns-client register -d zveronline.ru -s https://acme.tonargorn.ru
certbot certonly --manual --preferred-challenges dns --manual-auth-hook 'acme-dns-client' -d *.zveronline.ru -d zveronline.ru
```