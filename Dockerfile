FROM jenkinsci/jnlp-slave:3.27-1

MAINTAINER mzp <qiuranke@gmail.com>

USER root

ARG DOCKER_VERSION=18.06.1-ce
ARG BASE_URL=download.docker.com

RUN curl -fSL "https://${BASE_URL}/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" -o /tmp/docker-ce.tgz \
        && tar -xvzf /tmp/docker-ce.tgz --directory="/usr/local/bin" --strip-components=1 docker/docker \
        && rm /tmp/docker-ce.tgz

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo \
    && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jenkins

USER jenkins
