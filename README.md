# Quick Start

Run the image

```
docker run -ti --name acme-dns-client \
   --volume /srv/docker/acmedns:/etc/acmedns \
   ghcr.io/zveronline/acme-dns-client:latest \
   bash
```

```
acme-dns-client register -d zveronline.ru -s [https://acme.tonargorn.ru](https://acme.tonargorn.ru)
```