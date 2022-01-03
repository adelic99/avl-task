#!/bin/bash

docker pull ghcr.io/adelic99/service1:v1.0

kubectl apply -f deployment.yaml

helm install service1-chart/ --values service1-chart/values.yaml  --generate-name
export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services service1-chart)
export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
