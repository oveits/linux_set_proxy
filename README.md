# Automate HTTP Proxy Settings on Linux and Docker
Use case: as a road warrior, you often change your network environment from situations with HTTP proxy to situations without HTTP proxy and vice versa and you need an easy way to reconfigure the proxy settings of your machine, virtual machines and/or docker containers.

## Installation

```bash
git clone https://github.com/oveits/linux_set_proxy
cd linux_set_proxy; sudo ./install.sh
```
Optional (for bash): set alias in ~/.bashrc:
#### Example with single proxy:
```bash
alias p="source proxy proxy1.example.com 81"
```
#### Example with three proxies:
```bash
alias p="source proxy proxy1.example.com 81 || source proxy 10.1.1.1 8080 || source proxy proxy3.example.com 81"
```

## Usage

```bash
source proxy host port 
```
or if alias p="..." (see above) is set, just type:
```bash
p
```

## Result
This program will test, whether the HTTP proxy host (IP address or FQDN) answers to ping and set/reset the HTTP proxy settings like follows:

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
     
If the HTTP proxy host does not answer, it will
  1. clear the variable http_proxy
  2. clear the variable https_proxy
  3. on Docker hosts, it will remove any lines containing "export http" from the file /etc/defaults/docker and restart the docker service

## Known Limitiations
* The docker https settings do not work on CoreOS (yet)
* Apart from Cygwin/Mingw systems, sudo capabilities are required for the installation script
* For Docker hosts, sudo capabilities are required for changing the /etc/default/docker file and for restarting the docker service

