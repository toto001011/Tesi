#!/bin/bash


#echo "Stampa informazioni sul percorso"
#echo "Percorso attuale: $PWD"
#echo "Percorso di Docker: $(which dockerd)"
#echo "Percorso di k3d: $(which k3d)"
#echo "Percorso di kubectl: $(which kubectl)"
#echo "nameserver 8.8.8.8" > /etc/resolv.conf
#echo "nameserver 8.8.4.4" > /etc/resolv.conf

# Avvia il processo dockerd in background e disconnettilo dal terminale
echo "avvio il servizio dockerd"
sleep 10
 #dockerd >/dev/null 2>&1 &
 dockerd >/dev/null 2>&1 &
#exec dockerd

#bloccare e verificare
read
# Avvia il cluster Kubernetes utilizzando k3d in background
echo "avvio cluster comp-cluster"
sleep 60 #aspetto che dockerd si avvii correttamente
  k3d cluster create comp-cluster #>/dev/null 2>&1 &
  #k3d cluster list


echo "avvio pod comp.yaml"
sleep 10
 kubectl apply -f comp.yaml #>/dev/null 2>&1 &

# Attendi che il cluster Kubernetes sia pronto (puoi aggiungere un'attesa qui, se necessario)

# Esegui Nebula con il file di configurazione specificatoexec
echo "avvio il servizio nebula"
sleep 10
 ./nebula -config /nebula/config.yaml


