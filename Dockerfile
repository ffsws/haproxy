FROM registry.access.redhat.com/openshift3/ose-haproxy-router

ADD haproxy-config.template /var/lib/haproxy/conf/haproxy-config.template
