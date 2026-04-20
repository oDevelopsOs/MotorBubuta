FROM docker.io/searxng/searxng:latest

# Build context = raíz del repo (Render/Northflank). No uses context=deploy-service solo.
COPY deploy-service/settings.yml /etc/searxng/settings.yml
COPY deploy-service/render-entrypoint.sh /usr/local/searxng/render-entrypoint.sh
RUN chmod +x /usr/local/searxng/render-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/searxng/render-entrypoint.sh"]
