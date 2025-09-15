# Use official Node.js LTS image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy all source files
COPY . .

# Expose a port (Render requires this even if your bot doesn’t serve HTTP)
EXPOSE 3000

# Start the bot (change to index.mjs if needed)
CMD ["node", "index.js"]
