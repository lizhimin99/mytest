#!/usr/bin/env sh

web_port=30001
core_port=8443
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
                                                                                                                        
                                                                                                                        

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
					sed -i "5c db.createUser({user:'"$name"', pwd:'"$pwd1"', roles:[{role:'root',db:'admin'}]});" $SHELL_FOLDER"/entrypoint-initdb.sh"
					sed -i "6c db.auth('"$name"','"$pwd1"');" $SHELL_FOLDER"/entrypoint-initdb.sh"
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


# docker-compose up -d
echo -e "\033[32mNuclias services are running...\033[0m"
echo ""
echo "-- commands list -----------------------"
echo "|                                       |"
echo -e "|  start: \033[32mdocker-compose up -d\033[0m          |"
echo -e "|  stop:: \033[32mdocker-compose down\033[0m           |"
echo "|                                       |"
echo " ----------------------------------------"
exit 0





