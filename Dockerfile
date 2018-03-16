FROM alpine:latest

RUN apk add --update monit bash curl
RUN mkdir -p /var/lib/monit

EXPOSE 2812
ENTRYPOINT ["monit", "-c", "/etc/monit/monitrc", "-I"]
