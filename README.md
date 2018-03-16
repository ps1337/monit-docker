# A dockerized Monit server

[![Build Status](https://travis-ci.org/ps1337/monit-docker.png?branch=master)](https://travis-ci.org/ps1337/monit-docker)

This repo contains two variants of a dockerized [Monit](https://mmonit.com/monit/) server.

Use e.g.

```
docker run \
   -d \
   --name=monit \
   --restart=always \
   -v $PWD/monitrc:/etc/monit/monitrc \
   --expose 2812 \
   -p 127.0.0.1:2812:2812 \
   ps1337/monit:latest
```

to run this on `localhost`.
