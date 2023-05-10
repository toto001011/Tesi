# Dockerfile

FROM docker:dind

RUN apk add --no-cache ca-certificates

RUN curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.21.5+k3s2" sh -

COPY config.yaml /etc/rancher/k3s/config.yaml
COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["/usr/local/bin/start.sh"]

