    
#!/bin/bash

if [[ $# < 2 ]];then
	echo "Minimum 2 params required"
	exit 1
fi

remote_path=$BASH_ARGV

if [[ "$HOSTNAME" == "server1" ]]
then
    host="server2"
	command="scp"
	user=$USER
else
    host="server1"
	user="root"
	command="sshpass -p vagrant scp"
	sudo apt-get install sshpass
fi

for i in ${*%${!#}}
do
	if [[ ! -e $i ]]; then
		echo "'"$i"' does not exist"
		exit 1
	fi
	if [[ ! -d $remote_path ]]; then
		echo "file output is not defined"
		exit 1
	fi
	
	$command $i $user@$host:$remote_path
	
	if [[ $? != 0 ]]; then
		echo "Something went wrong!!!"
	fi
	for file in "$i"*
		do
			if [[ -f $file ]]
			then
				((size+=$(stat -c%s "$file")))
			fi
		done
done
echo "$size"