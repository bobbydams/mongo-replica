#!/bin/bash

docker-compose up -d

sleep 5

docker exec mongo-repl1 /scripts/rs-init.sh