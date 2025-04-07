FROM nginx:alpine

# Copy script and template
COPY entrypoint.sh /entrypoint.sh
COPY template.html /usr/share/nginx/html/template.html

RUN chmod +x /entrypoint.sh

# Run script before Nginx starts
CMD ["/entrypoint.sh"]
