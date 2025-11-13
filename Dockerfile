# -----------------------------
# Stage 1: Build Stage
# -----------------------------
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Since it’s a static HTML + JS + CSS app, just move files to /dist
RUN mkdir -p /dist && cp -r * /dist

# -----------------------------
# Stage 2: Production Stage
# -----------------------------
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy static build from builder stage
COPY --from=builder /dist /usr/share/nginx/html


# Expose default Nginx port
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
