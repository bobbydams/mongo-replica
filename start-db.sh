#!/bin/bash

docker-compose up -d --remove-orphans

sleep 15

docker exec mongo-repl1 /scripts/rs-init.sh

docker-compose logs --follow --tail=25