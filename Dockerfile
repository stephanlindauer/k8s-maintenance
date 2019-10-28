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
        iftop \
        postgresql-client \
        gnupg2

# install kubectl
RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.16.2/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# install gcloud
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y

ENTRYPOINT ["/bin/bash"]

CMD ["-c", "sleep infinity" ]
