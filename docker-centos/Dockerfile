FROM centos:latest
MAINTAINER Damien Claveau <damien.claveau@gmail.com>

RUN yum -y install git make gcc rpm rpm-build openssl-devel

WORKDIR /tmp
RUN git clone https://github.com/damienclaveau/carbon-c-relay_packages /tmp/carbon-c-relay

WORKDIR /tmp/carbon-c-relay
RUN git submodule update --init --recursive
RUN make rpmbuild
RUN yum -y install /tmp/carbon-c-relay/rpm/RPMS/x86_64/carbon-c-relay-1.5-1.el7.centos.x86_64.rpm


ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

ENV HOME /root
CMD ["/usr/local/bin/start.sh"]

