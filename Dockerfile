# Build context: repo root. Same image as deploy-service/Dockerfile (for PaaS that only look at /Dockerfile).
FROM docker.io/searxng/searxng:latest

COPY deploy-service/settings.yml /etc/searxng/settings.yml
COPY deploy-service/render-entrypoint.sh /usr/local/searxng/render-entrypoint.sh
RUN chmod +x /usr/local/searxng/render-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/searxng/render-entrypoint.sh"]
