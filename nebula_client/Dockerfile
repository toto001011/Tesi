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
 #RUN  service docker start
#RUN addgroup -S docker_group && \
  #  adduser -S -G docker_group user && \
   # chown user:docker_group /var/run/docker.sock

# Copia dei file di configurazione necessari a nebula
WORKDIR /nebula

# Crea un nuovo gruppo chiamato 'docker_group' e un nuovo utente non-root 'user'


COPY ./ca.key  /nebula/
COPY ./ca.crt /nebula/
COPY ./host.crt /nebula/
COPY ./host.key /nebula/
COPY ./config.yaml /nebula/
COPY ./nebula /nebula/
COPY ./comp.tar   /nebula/

RUN mkdir -p /etc/containerd
COPY config.toml /etc/containerd/


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


# Impostazione del comando predefinito per avviare Nebula
CMD ["./nebula", "-config", "/nebula/config.yaml"]

