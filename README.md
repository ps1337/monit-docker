# A dockerized Monit server

[![Build Status](https://travis-ci.org/ps1337/monit-docker.png?branch=master)](https://travis-ci.org/ps1337/monit-docker)

This repo contains a dockerized [Monit](https://mmonit.com/monit/) server.

To get a configuration file, call

```
docker run \                                                                                                                                                                                                                  ps@geraet
   -d \
   --name=monit \
   --restart=always \
   --expose 2812 \
   -p 127.0.0.1:2812:2812 \
   --entrypoint monit ps1337/monit-docker -I && \
docker exec -it monit bash -c "cat /etc/monitrc" && \
docker rm -f monit
```

Save the output to `monitrc`.


Then, use e.g.

```
docker run \
   -d \
   --name=monit \
   --restart=always \
   -v $PWD/monitrc:/etc/monit/monitrc \
   --expose 2812 \
   -p 127.0.0.1:2812:2812 \
   ps1337/monit-docker:latest
```

to run this on `localhost`.
