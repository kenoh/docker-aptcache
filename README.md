# apt-cache-ng in Docker


# Usage:

First time do `./_build.sh`, then `./_run.sh`, and then only `./start.sh` in the future when not running.

For the client containers to do what you want, ensure you have the proxy set up...
```docker
RUN echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy
```
... or ...
```bash
docker exec <your-conainer-id> sh -c 'echo '"'"'Acquire::http { Proxy "http://dockerhost:3142"; };'"'"' >> /etc/apt/apt.conf.d/01proxy'
```


# Credits

https://docs.docker.com/engine/examples/apt-cacher-ng/