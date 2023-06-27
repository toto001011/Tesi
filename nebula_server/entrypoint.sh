#!/bin/bash
# Avvia il processo dockerd in background e disconnettilo dal terminale
nohup dockerd >/dev/null 2>&1 &
echo "avvio cluster comp-cluster"
sleep 20

# Avvia il cluster Kubernetes utilizzando k3d in background
nohup k3d cluster create comp-cluster >/dev/null 2>&1 &
echo "avvio pod comp.yaml"
sleep 50
 
nohup kubectl apply -f comp.yaml >/dev/null 2>&1 &

# Attendi che il cluster Kubernetes sia pronto (puoi aggiungere un'attesa qui, se necessario)

# Esegui Nebula con il file di configurazione specificato
./nebula -config /nebula/config.yaml


