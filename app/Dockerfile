FROM nginx:alpine

# Copy script and template
COPY entrypoint.sh /entrypoint.sh
COPY index.html /usr/share/nginx/html/index.html

RUN chmod +x /entrypoint.sh

# Run script before Nginx starts
CMD ["/entrypoint.sh"]
