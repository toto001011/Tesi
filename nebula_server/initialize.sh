#!/bin/bash

echo "Avvio il servizio dockerd"
env

read
export DOCKER_HOST="unix:///var/run/docker.sock"
dockerd &
echo "PREMI un Tasto"
read
echo "STAMPO INFO  servizio dockerd"
docker info
echo "PREMI un Tasto per CHIUDERE"
read
# Controlla che dockerd sia in esecuzione
#while ! docker info >/dev/null 2>&1; do

 #   sleep 1
#done


