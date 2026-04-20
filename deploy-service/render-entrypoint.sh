#!/bin/sh
set -e

# Render sets PORT dynamically (usually 10000). SearXNG reads GRANIAN_PORT.
if [ -n "${PORT}" ]; then
  export GRANIAN_PORT="${PORT}"
fi

# Optional secret key injection from env.
if [ -n "${SEARXNG_SECRET_KEY}" ]; then
  sed -i "s|change-me-in-render|${SEARXNG_SECRET_KEY}|g" /etc/searxng/settings.yml
fi

exec /usr/local/searxng/entrypoint.sh
