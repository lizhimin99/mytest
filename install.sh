#!/bin/bash

TMP_NUCLIAS_CONNECT=/tmp/nuclias_connect
TMP_NUCLIAS_CONNECT_config=/tmp/nuclias_connect/config
if [ ! -d $TMP_NUCLIAS_CONNECT ];then
  mkdir -p $TMP_NUCLIAS_CONNECT
fi

cd $TMP_NUCLIAS_CONNECT
curl -o init.sh https://raw.githubusercontent.com/lizhimin99/mytest/master/init.sh
curl -o docker-compose.yml https://raw.githubusercontent.com/lizhimin99/mytest/master/docker-compose.yml
curl -o entrypoint-initdb.sh https://raw.githubusercontent.com/lizhimin99/mytest/master/entrypoint-initdb.sh
curl -o appconfig.json https://raw.githubusercontent.com/lizhimin99/mytest/master/appconfig.json
if [ ! -d $TMP_NUCLIAS_CONNECT_config ];then
  mkdir -p $TMP_NUCLIAS_CONNECT_config
fi
cd $TMP_NUCLIAS_CONNECT_config
curl -o systemconfig.json https://raw.githubusercontent.com/lizhimin99/mytest/master/config/systemconfig.json
cd $TMP_NUCLIAS_CONNECT
echo -e "\033[36mNow initial set the database administrator account for Nuclias,
please confirm is the first time set administrator account? [y/n]\033[0m"
echo "----1.read -p and -t ----"
read -t 20 -p "please enter your confirm:" k
echo "input is : $k"
if [ "$k" = "y" ];then
	read -p "User Name：" name
	if [ -n "$name" ]; then 
		read -p "Password：" pwd1
		if [ -n "$pwd1" ]; then
				read -p "Confirm Password：" pwd2
				if [ "$pwd1" != "$pwd2" ]; then
					echo -e "\033[31mConfirm password is not consistent\033[0m"
					exit 1
				else
					sed -i "5c db.createUser({user:'"$name"', pwd:'"$pwd1"', roles:[{role:'root',db:'admin'}]});" $TMP_NUCLIAS_CONNECT"/entrypoint-initdb.sh"
					sed -i "6c db.auth('"$name"','"$pwd1"');" $TMP_NUCLIAS_CONNECT"/entrypoint-initdb.sh"
				fi
		else
			echo -e "\033[31mThe input password is empty\033[0m"
			exit 1
		fi
	else
		echo -e "\033[31mThe input user name is empty\033[0m"
		exit 1
	fi
fi
sudo sh $TMP_NUCLIAS_CONNECT"/init.sh"
