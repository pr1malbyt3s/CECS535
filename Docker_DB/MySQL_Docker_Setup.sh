#NOT COMPLETE. NEED TO MAKE NECESSARY CHANGES FOR AUTHENTICATION AND CONNECTION ISSUES.


#!/bin/bash

#Set color variables.
GREEN='\033[0;32m'
NC='\033[0m'

#Download MySQL docker image.
echo -e "${GREEN}Downloading MySQL Docker image.${NC}"
docker pull mysql > /dev/null 2>&1

#Ensure container not already running.
echo -e "${GREEN}Ensuring MySQL container not already running.${NC}"
docker stop mysql_meadow > /dev/null 2>&1
sleep 2
docker rm mysql_meadow >/dev/null 2>&1

#Prompt user for MySQL root password to be used, as it is required for container startup.
echo -e "${GREEN}Please follow credentials prompt for database setup.${NC}"
while true
do
	read -sp 'Enter MySQL root password: ' mysqlpass
	echo
	read -sp 'Please enter MySQL root password again: ' mysqlpass2
	echo
	[ "$mysqlpass" = "$mysqlpass2" ] && break
	echo 'Passwords do not match. Please try again.'
	echo
done

#Initialize MySQL container, link localhost port to docker port and give time for container to start.
echo -e "${GREEN}Starting MySQL container.${NC}"
docker run --name mysql_meadow -e MYSQL_ROOT_PASSWORD=$mysqlpass --restart=always -d -p 127.0.0.1:3306:3306 mysql:5.7
sleep 3

#Install MySQL client.
apt-get install mysql-client -y > /dev/null 2>&1

#Inform user of connection instructions.
echo -e "${GREEN}You can now connect to your MySQL container using the syntax: mysql -h 127.0.0.1 -p3306 -u root -p${NC}"
echo -e "${GREEN}Enjoy!${NC}"
