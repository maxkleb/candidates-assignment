#!/bin/bash
#add fix to exercise1 here
echo "------------------EX1-----------------"
sudo ip route del 208.86.224.90
exit_code=$?
if [ $exit_code -eq "0" ];
	then 
	curl http://www.textfiles.com/art/bnbascii.txt
else
	echo "Cannot delete the route, something went wrong!!!"
