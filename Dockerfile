# Use official Node.js base image
FROM node:18

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY . .

# Expose port your app uses (update if not 3000)
EXPOSE 5000

# Start the app
CMD ["node", "index.js"]

