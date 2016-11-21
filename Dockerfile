FROM docker.io/openshift/origin-haproxy-router:v1.3.1

ADD haproxy-config.template.patch /var/lib/haproxy/conf
USER root
RUN yum install -y patch && \
    cd /var/lib/haproxy/conf && \
    patch -p0 <haproxy-config.template.patch && \
    yum remove -y patch && \
    yum clean all
USER 1001
