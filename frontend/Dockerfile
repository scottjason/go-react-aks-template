# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application (only for production)
RUN npm run build

# Stage 2: Production/Development
FROM --platform=linux/amd64 node:20-alpine
WORKDIR /app

# Install nodemon globally for development
RUN npm install -g nodemon

# Copy the application code from the builder stage
COPY --from=builder /app ./

# Expose the necessary port
EXPOSE 3000

# Command to run the application based on NODE_ENV
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = 'development' ]; then npm run dev; else npm start; fi"]
