#!/bin/bash
#add fix to exercise5-server1 here
sudo sed  -i  's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/i' /etc/ssh/ssh_config

status=$?
if [ ${status} -eq "0" ];
        then
        echo "StrictHostKeyChecking has been set to no "
   
	else
        echo "Updating of ssh_config of server1 failed!!!"
fi

cat /vagrant/fixScripts/server1_id_rsa_pub.txt  > /home/vagrant/.ssh/id_rsa.pub
cat /vagrant/fixScripts/server1_id_rsa.txt  > /home/vagrant/.ssh/id_rsa


chmod 644 /home/vagrant/.ssh/id_rsa.pub
chmod 600 /home/vagrant/.ssh/id_rsa
cat /vagrant/fixScripts/server2_id_rsa_pub.txt  >> /home/vagrant/.ssh/authorized_keys

status=$?
if [ ${status} -eq "0" ];
        then echo "*server 2 is authorized on server 1"
        else
        echo "something went wrong!!!"
fi