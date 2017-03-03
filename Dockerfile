FROM docker.io/openshift/origin-haproxy-router

ADD *.sh /var/lib/haproxy/conf/

RUN cd /var/lib/haproxy/conf && \
    for file in *.sh; do \
      ./$file haproxy-config.template; \
    done
