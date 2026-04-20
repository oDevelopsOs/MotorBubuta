FROM docker.io/searxng/searxng:latest

# Custom instance config for standalone deployment.
COPY settings.yml /etc/searxng/settings.yml
COPY render-entrypoint.sh /usr/local/searxng/render-entrypoint.sh
RUN chmod +x /usr/local/searxng/render-entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/usr/local/searxng/render-entrypoint.sh"]
