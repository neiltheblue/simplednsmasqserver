FROM alpine:3.4

RUN apk --no-cache add dnsmasq

COPY entrypoint.sh /entrypoint.sh

EXPOSE 53 53/udp

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
