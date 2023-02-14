#! /bin/sh

docker swarm init 

docker join bla bla bla bla

docker network create --driver overlay backend

docker network create --driver overlay frontend

docker service create --network frontend --replicas 2 --name vote -p 81:80 bretfisher/examplevotingapp_vote

docker service create --network frontend --name redis redis:3.2

docker service create --network frontend --network backend --name worker bretfisher/examplevotingapp_worker

docker service create --network backend --name db --mount type=volume,source=db-data,target=/var/lib/postgresql/data -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4

docker service create --network backend --name result -p 5001:80 bretfisher/examplevotingapp_result