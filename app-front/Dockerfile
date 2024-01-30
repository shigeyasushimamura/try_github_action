# Builder Stage (Node.js)
FROM node:16-slim as builder  # Use Node.js 16 slim image for the build stage
COPY package.json /app/       # Copy package.json to the container
COPY test.sh /app/            # Copy test.sh script to the container
WORKDIR /app/                 # Set the working directory
RUN yarn install              # Install dependencies
COPY . .                      # Copy the rest of the code to the container
RUN yarn run build            # Run the build command

# Deploy Stage (Nginx)
FROM nginx:stable             # Use stable Nginx image for the deployment stage
RUN mkdir -p /app/build/      # Create a directory for the built app
COPY --from=builder /app/build/ /app/build/  # Copy built app from the builder stage
COPY --chown=1001:1001 /nginx/default.conf /etc/nginx/conf.d/default.conf  # Copy Nginx default config
COPY --chown=1001:1001 /nginx/nginx.conf /etc/nginx/nginx.conf             # Copy main Nginx config
COPY --chown=1001:1001 /nginx/nginx-entrypoint.sh /app/nginx-entrypoint.sh  # Copy entrypoint script
RUN chmod +x /app/nginx-entrypoint.sh  # Make the entrypoint script executable
RUN chown -R 1001:1001 /var/cache/nginx /var/log/nginx /var/run/  # Change ownership for security
USER 1001  # Switch to user 1001
ENTRYPOINT ["/app/nginx-entrypoint.sh"]  # Set the entrypoint to initialize the container
