
# docker-nexbitd

[![Docker Stars](https://img.shields.io/docker/stars/nexbitio/nexbitd.svg)](https://hub.docker.com/r/nexbitio/nexbitd/)
[![Docker Pulls](https://img.shields.io/docker/pulls/nexbitio/nexbitd.svg)](https://hub.docker.com/r/nexbitio/nexbitd/)

A Docker configuration with sane defaults for running a fully-validating
Nexbit  node, based on [Alpine Linux](https://alpinelinux.org/).



## Quick start

Requires that [Docker should be installed](https://docs.docker.com/install/) on the host machine.

```bash
# Create some directory where your [nexbit] data will be stored.
$ mkdir /home/{*youruser}/nexbit_data
# *youruser is your sudoers username
# If you want to run from root then just change RPC user/pass and run.
$ docker run --name nexbitd -d \
   --env 'NBC_RPCUSER=foo' \
   --env 'NBC_RPCPASSWORD=password' \
   --env 'NBC_TXINDEX=1' \
   --volume /home/{*youruser}/nexbit_data:/root/.nexbit \
   -p 127.0.0.1:13519:13519 \
   --publish 13520:13520 \
   nexbitio/nexbitd

```

## Configuration

A custom `nexbit.conf` file can be placed in the mounted data directory.
Otherwise, a default `nexbit.conf` file will be automatically generated based
on environment variables passed to the container:

| name | default |
| ---- | ------- |
| NBC_RPCUSER | nbc_rpc |
| NBC_RPCPASSWORD | changeme |
| NBC_RPCPORT | 13519 |
| NBC_RPCALLOWIP | 127.0.0.1 |
| NBC_RPCCLIENTTIMEOUT | 30 |
| NBC_TXINDEX | 1 |
| NBC_TESTNET | 0 |
| NBC_DBCACHE | 512 |



## Daemonizing

```bash
Coming.......

```

# Implement NGINX
```bash
~#apt-get install nginx
~#nano /etc/nginx/nginx.conf
```
# Basic NGINX conf below (can use ssl also)

```bash
worker_processes  auto;


error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  10024;
}
http {
    sendfile      off;
    access_log    off;
    server_tokens off;
    keepalive_timeout  65;
    server {
        charset utf-8;
        client_max_body_size 128M;
        listen 80;
	location / {
		proxy_pass http://127.0.0.1:13519;
		proxy_redirect off;
	}
    }
}


```




Thank you. For more support and products please visit: https://nexbit.io
Mail me : [ developer@nexbit.io ]
