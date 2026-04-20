# Usar cuando el build context es SOLO esta carpeta (Northflank/Fly con "Root directory" = deploy-service).
FROM docker.io/searxng/searxng:latest

COPY settings.yml /etc/searxng/settings.yml
COPY render-entrypoint.sh /usr/local/searxng/render-entrypoint.sh
RUN chmod +x /usr/local/searxng/render-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/searxng/render-entrypoint.sh"]
