# mongo-replica

MongoDb ReplicaSet using Docker Compose

## Prerequisites

- Docker & docker-compose [Install](https://docs.docker.com/get-docker/)

## Exporting and Importing Data

To export data from a running MongoDb cluster, use the following command. Below is an example of exporting the `auth-manager` database in the `atlas-dev` cluster.

```shell
$ mongodump --username <username> --password <password> --db auth-manager --uri="mongodb+srv://atlas-dev.axfry.mongodb.net/"
```

To import the data into the local replica set, use the following command. Below is an example of importing all data from the `dump` directory into the local replica set.

```shell
$ mongorestore --host "unit_test/mongo-repl1:3300,mongo-repl2:3301,mongo-repl3:3302" --dir="./dump" --verbose"
```

## To start

```shell
$ ./start-db.sh [optional relica set name]
```

## To Stop

```shell
$ docker-compose down
```

## To connect

Using any Mongo GUI client or mongosh, you can connect with the following connection string.

```
mongodb://mongo-repl1:3330,mongo-repl2:3301,mongo-repl3:3302/myDatabase?connectTimeoutMS=300000&replicaSet=myReplica
```

## To cleanup

Data is persisted between shutdowns in the `./mongos` directory. This folder can be deleted in order to start over again.
