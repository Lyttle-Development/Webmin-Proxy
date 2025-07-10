# Use the official NGINX image with the stream module
FROM nginx:latest

# Install gettext (for envsubst)
RUN apt-get update && apt-get install -y gettext-base

# Copy the NGINX configuration template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Expose the necessary ports for both TCP and UDP
EXPOSE 80

# Start NGINX with dynamic configuration
CMD /bin/bash -c "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"
