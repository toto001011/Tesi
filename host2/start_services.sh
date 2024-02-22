#!/bin/bash


echo "Configure la variabile DOCKER_HOST"
#export DOCKER_HOST="unix:///var/run/docker.sock"
# Imposta le variabili d'ambiente
export DOCKER_HOST="unix:///var/run/docker.sock"
export DOCKER_VERSION="24.0.4"
export HOSTNAME="917670d6d751"
export DOCKER_BUILDX_VERSION="0.11.2"
export PWD="/nebula"
export HOME="/root"
export DOCKER_TLS_CERTDIR="/certs"
export TERM="xterm"
export DOCKER_COMPOSE_VERSION="2.20.2"
export SHLVL=1
export DIND_COMMIT="d58df1fc6c866447ce2cd129af10e5b507705624"
echo "Variabili d'ambiente configurate correttamente"
echo "Premi un tasto per continuare"
read

#----------

echo "Avvio servizio dockerd"
dockerd >/dev/null 2>&1 &

#echo "PREMI un Tasto"



# Controlla che dockerd sia in esecuzione
while ! docker info >/dev/null 2>&1; do
    echo "In attesa del completamento di dockerd..."
    sleep 1
done

echo "Il servizio dockerd è stato avviato correttamente."
echo "Premi un tasto per creare ed avvire il cluster comp-cluster ..."
read

#-------------


 ip route add 192.168.60.0/24 via 10.9.0.254

echo "Avvio il servizio Nebula"
./nebula -config /nebula/config.yaml
