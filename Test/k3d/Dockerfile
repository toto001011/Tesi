FROM docker:dind

#Installo le dipendenze necessarie per il funzionamento
RUN apk update && \
    apk add curl tar ca-certificates xz && \
    apk add openrc && \
    apk add iptables && \
    rm -rf /var/cache/apk/*
    
RUN apk update && apk upgrade && \
    apk add --no-cache bash git make cmake gcc musl-dev openssl-dev
RUN apk add curl 
RUN apk add vim

#Scarico e installo k3d
RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.0.0 bash

WORKDIR k3d
# Copia il file tar.gz di K3s nella directory corrente del Dockerfile
COPY kubectl  /k3d/
COPY comp.tar  /k3d/
COPY comp.yaml /k3d/

EXPOSE 80
EXPOSE 8080
EXPOSE 6444
EXPOSE 6443
#serve per kubernetes per pushare l'immagine nel registro locale 
EXPOSE 5000

#Installo Kubectl
RUN  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#RUN dockerd
#Creo e faccio partire il cluster su cui far partire il comp-pod 
#RUN k3d cluster create comp-cluster
#RUN kubectl apply -f comp.yaml
CMD k3d cluster create comp-cluster
# Avvia K3s
#CMD /bin/bash

