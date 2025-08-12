# Use an official Node.js runtime as a parent image
FROM node:20-slim

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . .

# The sample app listens on the port defined by the PORT environment variable, defaulting to 5000
EXPOSE 5000

# Run the web service on container startup.
CMD [ "npm", "start" ]
