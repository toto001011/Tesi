    FROM docker:dind
    RUN apk update && \
        apk add curl tar ca-certificates xz && \
        apk add openrc && \
        apk add iptables && \
        rm -rf /var/cache/apk/*
    RUN apk add curl tar ca-certificates xz
    RUN curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_ENABLE=true sh -
    RUN apk add --no-cache bash
    EXPOSE 80
    EXPOSE 8080
