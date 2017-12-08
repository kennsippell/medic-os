
FROM ubuntu:16.04
MAINTAINER Medic Mobile

RUN echo x64 > /etc/platform
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q=2 -y update
RUN apt-get -q=2 -y upgrade
RUN ln -sf /bin/bash /bin/sh
RUN apt-get -q=2 -y install apt-utils busybox less psmisc vim xz-utils

RUN groupadd avahi
RUN groupadd concierge-auth
RUN groupadd couchdb
RUN groupadd couchdb-lucene
RUN groupadd gammu
RUN groupadd gammu-inject
RUN groupadd gardener
RUN groupadd postgresql
RUN groupadd sshd
RUN groupadd vm

RUN useradd -rd /var/empty -c 'Service - Avahi' -g avahi avahi
RUN useradd -rd /var/empty -c 'Service - Concierge' -g concierge-auth concierge
RUN useradd -rd /var/empty -c 'Service - CouchDB' -g couchdb couchdb
RUN useradd -rd /var/empty -c 'Service - Lucene' -g couchdb-lucene couchdb-lucene
RUN useradd -rd /var/empty -c 'Service - Gammu' -g gammu gammu
RUN useradd -rd /var/empty -c 'Service - Gardener' -g gardener gardener
RUN useradd -rd /var/empty -c 'Service - Postgres' -g postgresql postgresql
RUN useradd -rd /var/empty -c 'Service - Secure Shell' -g sshd sshd
RUN useradd -rd /var/empty -c 'Legacy - VM Login' -g vm vm

ADD platform/staging/tarball/x64/medic-os-*-native /

VOLUME [ "/srv" ]
ENTRYPOINT [ "/boot/container-start", "/" ]

