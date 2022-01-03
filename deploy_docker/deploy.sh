#!/bin/bash

docker pull ghcr.io/adelic99/service1:$1
docker pull ghcr.io/adelic99/service2:$2

docker network create net_serivce12

docker container run --net net_serivce12 --name service.example.com -d ghcr.io/adelic99/service1:$1

docker container run --net net_serivce12 -p 8080:8080 -d ghcr.io/adelic99/service2:$2

curl -X POST http://localhost:8080 -d $3