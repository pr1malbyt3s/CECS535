#!/bin/bash

#Set color variables.
GREEN='\033[0;32m'
NC='\033[0m'

#Ensure container not already running.
echo -e "${GREEN}Ensuring PostgreSQL container not already running.${NC}"
docker stop postgresql_playground > /dev/null 2>&1
sleep 2
docker rm postgresql_playground > /dev/null 2>&1

#Initialize PostgreSQL container, link localhost port to docker port and give time for container to start.
echo -e "${GREEN}Starting PostgreSQL container.${NC}"
docker run --name postgresql_playground --restart=always -d -p 127.0.0.1:5432:5432 postgres
sleep 3

#Create password for postgres default user.
#NEED TO ADD PASSWORD CHECK METHOD!
echo -e "${GREEN}You will be prompted for new PostgreSQL password for user postgres.${NC}"
docker exec -it postgresql_playground psql -U postgres -c "\password postgres"

#Download and install PostgreSQL client.
##Add PostgreSQL APT respository.
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
##Import repository signing key.
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
##Update system.
apt update
##Install client software for PostgreSQL.
apt-get -y install postgresql-client-10

#Setup finished. Inform user.
echo -e "${GREEN}PostgreSQL Docker container setup complete!${NC}"
echo -e "${GREEN}You can access your database at localhost port 5342.${NC}"
echo -e "${GREEN}Use the command 'psql -h localhost -p 5432 -U postgres' to do so.${NC}"
