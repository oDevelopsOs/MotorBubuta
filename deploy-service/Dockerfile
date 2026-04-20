# Build context = raíz del repo (Northflank con context `/` y path `/deploy-service/Dockerfile`).
# Igual que /Dockerfile en la raíz.
FROM docker.io/searxng/searxng:latest

COPY deploy-service/settings.yml /etc/searxng/settings.yml
COPY deploy-service/render-entrypoint.sh /usr/local/searxng/render-entrypoint.sh
RUN chmod +x /usr/local/searxng/render-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/searxng/render-entrypoint.sh"]
