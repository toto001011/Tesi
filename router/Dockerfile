#FROM alpine:latest
FROM docker:dind
LABEL maintainer="Salvatore Francesco Indino"

# Crea la directory per i file di configurazione di Docker
RUN mkdir -p /etc/docker

# Abilita Docker over TCP sull'indirizzo IP del nodo Nebula
RUN echo '{"hosts": ["tcp://0.0.0.0:2378", "unix:///var/run/docker.sock"], "tls": false}' > /etc/docker/daemon.json

# Installazione dipendenze per Nebula
RUN apk update && apk upgrade && \
    apk add --no-cache bash git make cmake gcc musl-dev openssl-dev

RUN apk add --no-cache go
#RUN apk add --no-cache docker


    
RUN apk update && apk add docker
RUN apk update && apk add openrc

RUN apk update && \
        apk add curl tar ca-certificates xz && \
        apk add openrc && \
        apk add iptables && \
        rm -rf /var/cache/apk/*
    RUN apk add curl tar ca-certificates xz





# Copia dei file di configurazione necessari a nebula

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
#serve per kubernetes per pushare l'immagine nel registro locale 
EXPOSE 5000
#Porta per kubernetes
EXPOSE 2378
EXPOSE 32430
EXPOSE 5678
EXPOSE 8443

# Imposta lo script start_services.sh come ENTRYPOINT
CMD ["tail", "-f", "/dev/null"]

