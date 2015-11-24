#!/bin/sh

mingw=`uname -a | grep MINGW`

if [ "$mingw" = "" ]; 
then
  sudo cp proxy /usr/local/bin/proxy
  sudo chmod 755 /usr/local/bin/proxy
else
  # no sudo on cygwin/mingw:
  cp proxy /bin/proxy
  chmod 755 /bin/proxy
fi
