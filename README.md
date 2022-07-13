# mongo-replica

MongoDb ReplicaSet using Docker Compose

## Prerequisites

* Docker & docker-compose [Install](https://docs.docker.com/get-docker/)

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
mongodb://mongo-repl1:3000,mongo-repl2:3001,mongo-repl3:3002/myDatabase?connectTimeoutMS=300000&replicaSet=myReplica
```

## To cleanup

Data is persisted between shutdowns in the `./mongos` directory. This folder can be deleted in order to start over again.
