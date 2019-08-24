#!/bin/bash
#add fix to exercise4-server1 here
sudo sed -i '$ a 192.168.100.11 server2' /etc/hosts

status=$?
if [ ${status} -eq "0" ];
        then
        echo "server 1 has been added to hosts"
else
      echo "Something went wrong"
fi
