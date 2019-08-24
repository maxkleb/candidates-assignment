#!/bin/sh

PERMISSIONS_DENIED="deny from all"

#path to your sites-avilable
PATH_TO_CONF="/etc/apache2/sites-available/default"

if [ -n "$(grep "${PERMISSIONS_DENIED}" $PATH_TO_CONF)" ];
then
    echo "Updateing apache2 permissions!!!"
    sudo sed  -i  's/deny from all/Allow from all/i'  /etc/apache2/sites-available/default
    echo "Restarting apache2 server!!!"
    sudo service  apache2 reload
else
    echo "Permissions already granted or something went wrong!!!"
fi