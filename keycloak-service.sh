#!/bin/bash

case "$1" in 
start)
   /usr/share/keycloak-server/bin/standalone.sh -b=0.0.0.0 &
   echo $!>/var/run/keycloak-server.pid
   ;;
stop)
   kill `cat /var/run/keycloak-server.pid`
   rm /var/run/keycloak-server.pid
   ;;
restart)
   $0 stop
   $0 start
   ;;
status)
   if [ -e /var/run/keycloak-server.pid ]; then
      echo Keycloak server is running, pid=`cat /var/run/keycloak-server.pid`
   else
      echo Keycloak server is NOT running
      exit 1
   fi
   ;;
*)
   echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0
