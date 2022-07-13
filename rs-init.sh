#!/bin/bash

REPLICA_SET_NAME=${1:-myReplica}

echo "Initialising replica $REPLICA_SET_NAME"

mongo --port 3000 <<EOF
var config = {
    "_id": "$REPLICA_SET_NAME",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo-repl1:3000",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "mongo-repl2:3001",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "mongo-repl3:3002",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF