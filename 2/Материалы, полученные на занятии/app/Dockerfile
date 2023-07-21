# Use the official Node.js image as the base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the application code to the container
COPY app.js .

# Expose port 8000 for the application
EXPOSE 8000

# Start the application
CMD ["npm", "start"]
