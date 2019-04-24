FROM gocd/gocd-agent-ubuntu-18.04:v19.2.0
MAINTAINER Jemstep Dev <dev@jemstep.com>

ENV KUBE_LATEST_VERSION="v1.3.5"

RUN apt-get -y update && \
        apt-get -y install gnupg2 apt-transport-https

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
        touch /etc/apt/sources.list.d/kubernetes.list  && \
        echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
        apt-get update && \
        apt-get install -y kubectl
