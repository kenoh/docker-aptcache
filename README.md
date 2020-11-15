# apt-cache-ng in Docker


# Usage:

## The cache container (aka server)

First time do `./_build.sh`, then `./_run.sh`, and then only `./start.sh` in the future when not running.

> HINT: You might need to `docker network create aptcache` beforehand.

## Your containers (aka clients)

Ensure you have the proxy set up...
```docker
RUN echo 'Acquire::http { Proxy "http://aptcache:3142"; };' >> /etc/apt/apt.conf.d/01proxy
```
... or ...
```bash
docker exec <your-conainer-id> sh -c 'echo '"'"'Acquire::http { Proxy "http://aptcache:3142"; };'"'"' >> /etc/apt/apt.conf.d/01proxy'
```
... And then when you do `docker run` or `docker build`, you need to run with `--network aptcache`; this makes your container able to see the *aptcache* container ([by name](https://docs.docker.com/engine/reference/commandline/run/#connect-a-container-to-a-network---network)) which is in the same network since the same parameters in the `_run.sh` file.


# Credits

https://docs.docker.com/engine/examples/apt-cacher-ng/
