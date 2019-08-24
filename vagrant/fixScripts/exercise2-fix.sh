#!/bin/bash
#add fix to exercise2 here

#path to your HOSTSFILE
ETC_HOSTS="/etc/hosts"

# Hostname to add/remove.
HOSTNAME="www.ascii-art.de"

if [ -n "$(grep $HOSTNAME /etc/hosts)" ];
then
	echo "$HOSTNAME Found in your $ETC_HOSTS, Removing now...";
	sudo sed -i'' -e  "/$HOSTNAME/d" $ETC_HOSTS
else
	echo "$HOSTNAME was not found in your $ETC_HOSTS";
fi

curl http://www.ascii-art.de/ascii/ab/007.txt