FROM alpine:latest
RUN apk add --update --no-cache bash dcron logrotate curl tini nano certbot
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
WORKDIR /app
RUN apk add --update --no-cache --virtual .build-deps go \
 && go install github.com/acme-dns/acme-dns-client@latest \
 && cp /root/go/bin/acme-dns-client /usr/local/bin/ \
 && apk del -f .build-deps \
 && rm -rf /root/go \
 && rm -rf /tmp/*
#RUN wget https://github.com/acme-dns/acme-dns-client/releases/download/v0.3/acme-dns-client_0.3_linux_amd64.tar.gz \
# && tar xvfz acme-dns-client_0.3_linux_amd64.tar.gz \
# && cp acme-dns-client /usr/local/bin/

VOLUME ["/etc/acmedns", "/etc/letsencrypt"]
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/entrypoint.sh"]