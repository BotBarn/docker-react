FROM node:16-alpine as builder
# Set the working directory
WORKDIR /app
# Copy package.json
COPY package.json ./
# Install dependencies
RUN npm install
# Copy the rest of the application code
COPY . .
# Build the application
RUN npm run build

# Production image
FROM nginx
# Copy only the necessary files from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html


