#!/bin/bash

REPLICA_SET_NAME=${1:-myReplica}

echo "Initialising replica $REPLICA_SET_NAME"

mongo --port 3300 <<EOF
var config = {
    "_id": "$REPLICA_SET_NAME",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo-repl1:3300",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "mongo-repl2:3301",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "mongo-repl3:3302",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF