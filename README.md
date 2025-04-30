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
    environment:
      - TZ=Europe/Moscow
      - CRON_JOB_CERTBOT="0 0,12 * * * root sleep 279 && certbot renew -q"
    restart: unless-stopped
```

```
acme-dns-client register -d zveronline.ru -s https://acme.tonargorn.ru
certbot certonly --manual --preferred-challenges dns --manual-auth-hook 'acme-dns-client' -d *.zveronline.ru -d zveronline.ru
```