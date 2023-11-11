
FROM docker:dind
LABEL maintainer="Salvatore Francesco Indino"

# Crea la directory per i file di configurazione di Docker
RUN mkdir -p /etc/docker

# Abilita Docker over TCP sull'indirizzo IP del nodo Nebula
RUN echo '{"hosts": ["tcp://0.0.0.0:2379", "unix:///var/run/docker.sock"], "tls": false}' > /etc/docker/daemon.json

# Installazione dipendenze per Nebula
RUN apk update && apk upgrade && \
    apk add --no-cache bash git make cmake gcc musl-dev openssl-dev

RUN apk add --no-cache go
RUN apk update && apk add docker
RUN apk update && apk add openrc
RUN apk update && \
        apk add curl tar ca-certificates xz && \
        apk add openrc && \
        apk add iptables && \
        rm -rf /var/cache/apk/*
RUN apk add curl tar ca-certificates xz




#Scarico e installo k3d
RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.0.0 bash

# Copia dei file di configurazione necessari a nebula e k3d
WORKDIR /nebula

COPY ./ca.key  /nebula/
COPY ./ca.crt /nebula/
COPY ./host.crt /nebula/
COPY ./host.key /nebula/
COPY ./config.yaml /nebula/
COPY ./nebula /nebula/
COPY kubectl  /nebula/
COPY kubefedctl  /nebula/
COPY comp.yaml /nebula/

COPY KubeFedConfig.yaml /nebula/
COPY crds.yaml /nebula/

COPY start_services.sh /usr/local/bin/start_services.sh

# Imposta i permessi di esecuzione 
RUN chmod +x /nebula/nebula
RUN chmod +x /usr/local/bin/start_services.sh

#Installo Kubectl
RUN  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN  install -o root -g root -m 0755 kubefedctl /usr/local/bin/kubefedctl

# Esposizione delle porte utilizzate da Nebula
EXPOSE 4242/tcp
EXPOSE 4242/udp

EXPOSE 4241/tcp
EXPOSE 4241/udp

EXPOSE 4243/tcp
EXPOSE 4243/udp
EXPOSE 80
EXPOSE 8080
EXPOSE 6444
EXPOSE 6443

EXPOSE 443

#serve per kubernetes per pushare l'immagine nel registro locale 
EXPOSE 5000

#Porta per kubernetes
EXPOSE 2378
EXPOSE 2379







# Imposta lo script start_services.sh come ENTRYPOINT
CMD ["/usr/local/bin/start_services.sh"]


