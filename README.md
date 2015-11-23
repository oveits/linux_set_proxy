# Linux Detect and Set Proxy


> source proxy host port 

will test, whether the host (IP address or FQDN) answers to ping.

If yes, it will
1. set the variable http_proxy to http://ip:port (export http_proxy=http://ip:port)
2. set the variable https_proxy to http://ip:port (export https_proxy=http://ip:port)
3. on Docker hosts, it will add the lines
   export http_proxy=http://ip:port
   export https_proxy=http://ip:port
   to the file /etc/defaults/docker
   and restart the docker service

If no, it will
1. clear the variable http_proxy
2. clear the variable https_proxy
3. on Docker hosts, it will remove any lines starting with "export http" from the file /etc/defaults/docker and restart the docker service

# known limitiations
The docker settings do not work on CoreOS (yet)

