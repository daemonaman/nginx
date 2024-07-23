# Use the official Nginx image from the Docker Hub
FROM nginx:latest

# Remove the default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the index.html file to the web server's root directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]