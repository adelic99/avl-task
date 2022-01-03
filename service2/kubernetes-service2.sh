#!/bin/bash

docker pull ghcr.io/adelic99/service2:v1.0

kubectl apply -f deployment.yaml

helm install service2-chart/ --values service2-chart/values.yaml  --generate-name
export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services service2-chart)
export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT

