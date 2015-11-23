# Linux: Detection of Availability of HTTP Proxy
Use case: as a road warrior, you often change your network environment from situations with HTTP proxy to situations without HTTP proxy and vice versa and you need an easy way to reconfigure the proxy settings of your machine, virtual machines and/or docker containers.

## Installation

```bash
git clone https://github.com/oveits/linux_set_proxy
cd linux_set_proxy; sudo ./install.sh
```

## Usage

```bash
usage: source proxy host port 
```

## Result
This program will test, whether the host (IP address or FQDN) answers to ping and set/reset the HTTP ptoxy settings like follows:

If the host answers, it will
  1. set the variable http_proxy to http://host:port (export http_proxy=http://host:port)
  2. set the variable https_proxy to http://host:port (export https_proxy=http://host:port)
  3. on Docker hosts, it will append following lines to the file /etc/defaults/docker (if not already present): 
```bash
  export http_proxy=http://host:port
  export https_proxy=http://host:port
```
and restart the docker service:
```bash
  restart docker
```     
     
If the host does not answer, it will
  1. clear the variable http_proxy
  2. clear the variable https_proxy
  3. on Docker hosts, it will remove any lines containing "export http" from the file /etc/defaults/docker and restart the docker service

## Known Limitiations
* The docker https settings do not work on CoreOS (yet)
* if host and port are omitted, then the hardcoded values host=172.28.12.5 and port=8080 will be used (those values can be changed in the detectAndSetProxy() function within the proxy shell script)

