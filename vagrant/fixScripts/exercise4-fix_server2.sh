#!/bin/bash
#add fix to exercise4-server2 here
sudo sed -i '$ a 192.168.100.10 server1' /etc/hosts

status=$?
if [ ${status} -eq "0" ];
        then
        echo "server 2 has been added to hosts"
else
        echo "Something went wrong"
fi