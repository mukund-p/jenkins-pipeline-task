# Use official nginx image
FROM nginx:alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy your index.html to nginx content directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

