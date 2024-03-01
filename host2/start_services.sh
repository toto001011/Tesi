#!/bin/bash
echo "Avvio lo script di star k3s"
start-k3s.sh >/dev/null 2>&1 & 

echo "Configure la variabile DOCKER_HOST"



# Controlla che dockerd sia in esecuzione
while ! docker info >/dev/null 2>&1; do
    echo "In attesa del completamento di dockerd..."
    sleep 1
done

echo "Il servizio dockerd è stato avviato correttamente."

echo "Aggiungo regola di routing"


#ip route add 10.9.0.0/24 via 192.168.60.254
ip route add 192.168.60.0/24 via 10.9.0.254
echo "Avvio il servizio Nebula"
./nebula -config /nebula/config.yaml

