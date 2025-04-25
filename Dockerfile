FROM alpine:latest
RUN apk add --update --no-cache bash nano certbot go && mkdir /opt/acme
WORKDIR /opt/acme
RUN go install github.com/acme-dns/acme-dns-client@latest
#RUN wget https://github.com/acme-dns/acme-dns-client/releases/download/v0.3/acme-dns-client_0.3_linux_amd64.tar.gz \
# && tar xvfz acme-dns-client_0.3_linux_amd64.tar.gz \
# && cp acme-dns-client /usr/local/bin/

VOLUME ["/etc/acmedns", "/etc/letsencrypt"]
CMD ["bash"]