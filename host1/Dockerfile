FROM docker:19.03.7-dind

ENV K3S_VERSION="v1.18.4%2Bk3s1"
EXPOSE 8443

ADD https://github.com/rancher/k3s/releases/download/${K3S_VERSION}/k3s /usr/local/bin/k3s
COPY kubectl start-k3s.sh get-kubeconfig.sh /usr/local/bin/

# Note: the k3s kubectl command unpacks the k3s binaries as a side effect
RUN  apk --no-cache add bash && \
    chmod a+x \
        /usr/local/bin/k3s \
        /usr/local/bin/start-k3s.sh \
        /usr/local/bin/get-kubeconfig.sh \
        /usr/local/bin/kubectl \
        && \
    k3s kubectl --help > /dev/null
WORKDIR /nebula

COPY ./ca.key  /nebula/
COPY ./ca.crt /nebula/
COPY ./host.crt /nebula/
COPY ./host.key /nebula/
COPY ./config.yaml /nebula/
COPY ./nebula /nebula/
COPY start_services.sh /usr/local/bin/start_services.sh
# Imposta i permessi di esecuzione 
RUN chmod +x /nebula/nebula
RUN chmod +x /usr/local/bin/start_services.sh

ENTRYPOINT [ "/usr/local/bin/start_services.sh" ]
