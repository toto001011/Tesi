#FROM alpine:latest
FROM docker:dind
LABEL maintainer="Salvatore Francesco Indino"

# Installazione dipendenze per Nebula
RUN apk update && apk upgrade && \
    apk add --no-cache bash git make cmake gcc musl-dev openssl-dev

RUN apk add --no-cache go
#RUN apk add --no-cache docker


    
RUN apk update && apk add docker
RUN apk update && apk add openrc

RUN apk add runit

RUN apk update && \
        apk add curl tar ca-certificates xz && \
        apk add openrc && \
        apk add iptables && \
        rm -rf /var/cache/apk/*
RUN apk add curl tar ca-certificates xz


#Scarico e installo k3d
RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.0.0 bash

# Copia dei file di configurazione necessari a nebula
WORKDIR /nebula

# Crea un nuovo gruppo chiamato 'docker_group' e un nuovo utente non-root 'user'


COPY ./ca.key  /nebula/
COPY ./ca.crt /nebula/
COPY ./host.crt /nebula/
COPY ./host.key /nebula/
COPY ./config.yaml /nebula/
COPY ./nebula /nebula/
COPY comp.yaml /nebula/
RUN chmod +x /nebula/nebula

COPY kubectl  /nebula/
#Installo Kubectl
RUN  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN mkdir -p /etc/containerd
COPY config.toml /etc/containerd/

COPY k3d_services.sh /usr/local/bin/k3d_services.sh
RUN chmod +x /usr/local/bin/k3d_services.sh

RUN ifconfig

# Esposizione delle porte utilizzate da Nebula
EXPOSE 4242/tcp
EXPOSE 4242/udp

EXPOSE 4241/tcp
EXPOSE 4241/udp

EXPOSE 4243/tcp
EXPOSE 4243/udp

# Install sudo package
RUN apk add --no-cache sudo
RUN apk update && apk add bind-tools


#RUN apk add update && apk add install -yq linux-modules-extra-$(uname -r)




WORKDIR /nebula





#CMD ["dockerd"]

# Imposta lo script di entrypoint come ENTRYPOINT
CMD ["/usr/local/bin/k3d_services.sh"]


