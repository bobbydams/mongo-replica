#!/bin/bash

REPLICA_SET_NAME=${1:-myReplica}

REPLICA_SET_NAME=$REPLICA_SET_NAME docker-compose up -d --remove-orphans

sleep 15

docker exec mongo-repl1 /scripts/rs-init.sh $REPLICA_SET_NAME

docker-compose logs --follow --tail=25

echo "--------------------"
echo "Running MongoDb in background. To stop run: docker-compose down"
echo "--------------------"