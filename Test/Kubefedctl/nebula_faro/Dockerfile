
#FROM alpine:latest
FROM docker:dind
LABEL maintainer="Salvatore Francesco Indino"
RUN apk update
# Crea la directory per i file di configurazione di Docker
RUN mkdir -p /etc/docker

# Abilita Docker over TCP sull'indirizzo IP del nodo Nebula
#RUN echo '{"hosts": ["tcp://0.0.0.0:2378", "unix:///var/run/docker.sock"], "tls": false}' > /etc/docker/daemon.json

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


# Imposta i permessi del binario kubeadm



RUN apk add gcompat 
RUN apk add helm
RUN apk add kind
# Copia dei file di configurazione necessari a nebula
WORKDIR /nebula

# Crea un nuovo gruppo chiamato 'docker_group' e un nuovo utente non-root 'user'


COPY ./ca.key  /nebula/
COPY ./ca.crt /nebula/
COPY ./host.crt /nebula/
COPY ./host.key /nebula/
COPY ./config.yaml /nebula/
COPY ./nebula /nebula/
COPY kubectl  /nebula/
COPY kubefedctl  /nebula/
COPY start_services.sh /usr/local/bin/start_services.sh
#COPY kubeconfig.yaml /nebula/

#RUN mkdir /kube_cert/
#COPY ./kube_cert/ca.crt /nebula/kube_cert/
#COPY ./kube_cert/client.crt /nebula/kube_cert/
#COPY ./kube_cert/client.key /nebula/kube_cert/
#COPY ./executable/crictl /usr/local/bin/
#COPY ./executable/kubefedctl /usr/local/bin/
#COPY ./executable/kubelet /usr/local/bin/

# Imposta i permessi di esecuzione 
RUN chmod +x /nebula/nebula
RUN chmod +x /usr/local/bin/start_services.sh
#RUN chmod +x /usr/local/bin/crictl
#RUN chmod +x /usr/local/bin/kubefedctl
#RUN chmod +x /usr/local/bin/kubelet

RUN git clone https://github.com/kubernetes-retired/kubefed.git



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
#serve per kubernetes per pushare l'immagine nel registro locale 
EXPOSE 5000
#Porta per kubernetes
EXPOSE 2378
EXPOSE 443
EXPOSE 10250


# Scarica e installa kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Scarica e installa kubelet e kubeadm
RUN apk add --no-cache --virtual .build-deps \
        iproute2 \
        iptables \
        xfsprogs \
        util-linux \
        findmnt \
        e2fsprogs \
        e2fsprogs-extra \
        sfdisk \
        openssl \
        bash && \
    curl -L -o /usr/local/bin/kubelet "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubelet" && \
    curl -L -o /usr/local/bin/kubeadm "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubeadm" && \
    chmod +x /usr/local/bin/kubelet /usr/local/bin/kubeadm && \
    apk del .build-deps
RUN apk add kind
RUN apk add git
# Configura il nodo Kubernetes
RUN mkdir -p /etc/systemd/system/kubelet.service.d && \
    echo '[Service]\nEnvironment="KUBELET_KUBEADM_ARGS=--cgroup-driver=cgroupfs"\nEnvironment="KUBELET_SYSTEMD_ARGS=--runtime-cgroups=/systemd/system.slice --kubelet-cgroups=/systemd/system.slice"\n' > /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

# Pulisci la cache di apk
RUN rm -rf /var/cache/apk/*


# Imposta lo script start_services.sh come ENTRYPOINT
CMD ["/usr/local/bin/start_services.sh"]

