    FROM docker:dind
    RUN apk update && \
        apk add curl tar ca-certificates xz && \
        apk add openrc && \
        apk add iptables && \
        rm -rf /var/cache/apk/*
    RUN apk add --no-cache bash
    RUN apk add curl tar ca-certificates xz
    RUN curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_ENABLE=true sh -
    RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
    
    WORKDIR /comp
    COPY ./comp.tar /comp
    EXPOSE 80
    EXPOSE 8080
    CMD dockerd
