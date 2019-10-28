FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y \
        curl \
        htop \
        net-tools \
        nmap \
        tcpdump \
        traceroute \
        telnet \
        wget \
        iotop \
        jq \
        iftop

# install kubectl
RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.16.2/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["/bin/bash"]

CMD ["-c", "sleep infinity" ]
