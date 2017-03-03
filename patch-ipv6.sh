#!/bin/bash

set -e

sed -e 's|bind :{{env "ROUTER_SERVICE_HTTP_PORT" "80"}}|\
\0\
bind :::{{env "ROUTER_SERVICE_HTTP_PORT" "80"}} v6only\
|' -e 's|bind :{{env "ROUTER_SERVICE_HTTPS_PORT" "443"}}|\
\0\
bind :::{{env "ROUTER_SERVICE_HTTPS_PORT" "443"}} v6only\
|' <$1 >$1.tmp

if diff -q $1 $1.tmp >/dev/null; then
  echo "Failed to apply `basename $0 .sh`" >&2
  exit 1
else
  echo "Applied `basename $0 .sh`"
fi

mv $1.tmp $1
