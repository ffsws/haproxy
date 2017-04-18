#!/bin/bash

ORIG_TEMPLATE_FILE=/var/lib/haproxy/conf/haproxy-config.template

if [ ! "${TEMPLATE_FILE}" -ef "${ORIG_TEMPLATE_FILE}" ]; then
  cp "${TEMPLATE_FILE}" "${ORIG_TEMPLATE_FILE}"

  for script in /var/lib/haproxy/prestart.d/*; do
    $script
  done
else
  echo "Warning: TEMPLATE_FILE not defined, skipping prestart scripts!" >&2
fi

exec "$@"
