FROM registry.access.redhat.com/openshift3/ose-haproxy-router

ADD haproxy-config.template.patch /var/lib/haproxy/conf
RUN yum install -y patch && \
    cd /var/lib/haproxy/conf && \
    patch -p0 <haproxy-config.template.patch && \
    yum remove -y patch && \
    yum clean all
