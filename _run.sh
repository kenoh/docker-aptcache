#!/bin/bash
docker run -d -p 3124:3124 --name aptcache --hostname aptcache --network aptcache aptcache
