FROM docker:dind

RUN apk update && \
    apk add curl tar ca-certificates xz && \
    apk add openrc && \
    apk add iptables && \
    rm -rf /var/cache/apk/*
    
RUN apk update && apk upgrade && \
    apk add --no-cache bash git make cmake gcc musl-dev openssl-dev
# Copia il file tar.gz di K3s nella directory corrente del Dockerfile
WORKDIR k3s
COPY kubectl  /k3s/
#COPY comp.tar /k3s/
COPY comp_pod.yaml /k3s/
#COPY k3s.tar.gz /k3s/
#COPY k3s /usr/local/bin/

#RUN tar xzf /k3s/k3s.tar.gz -C /k3s/




# Aggiunge i servizi al boot
#RUN rc-update add crond && \
 #   rc-update add acpid && \
 #   rc-update add local && \
 #   rc-update add netmount && \
 #   rc-update add swap && \
 #   rc-service crond start
 #INSTALLO KUBECTL
 EXPOSE 80
 EXPOSE 8080
 EXPOSE 6444
 EXPOSE 6443
RUN  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Avvia K3s
#CMD ["/bin/bash", ""]

