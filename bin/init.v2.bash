#!/bin/bash
. .env
export USER_PASSWORD=$USER_PASSWORD
export PHPVER=$PHPVER
export DBNAME=$DBNAME
export APP=$APP
export USER=`whoami`
export USERID=`id -u $USER`
export GROUP=`id -gn`
CLEAN=$1

# Build docker containers
echo "Building docker containers"
docker compose build --build-arg ARG_DOMAIN="s1.ralphtsmith.com" --build-arg ARG_APP="$APP" --build-arg PHPVER="$PHPVER" --build-arg ARG_USER="$USER"  --build-arg ARG_USERID="$USERID" --build-arg ARG_GROUP="$GROUP" --build-arg ARG_USERPASS="$USER_PASSWORD" --build-arg DOCKERUSER=$DOCKERUSER --build-arg DOCKERGROUP=$DOCKERGROUP --build-arg DOCKERUSERID=$DOCKERUSERID
echo "Starting docker"
docker compose up -d
export PATH=$PATH:$BINPATH
