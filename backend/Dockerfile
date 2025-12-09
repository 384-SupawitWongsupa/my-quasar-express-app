# Stage 1: Builder
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
# Install dependencies
RUN npm ci

COPY . .

# Stage 2: Production
FROM node:20-alpine

WORKDIR /app

# Create logs directory and ensure permissions
RUN mkdir -p logs && chown -R node:node /app

# Switch to non-root user for security
USER node

# Copy application code and node_modules from builder
COPY --from=builder --chown=node:node /app /app

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:3000/api/demo || exit 1

EXPOSE 3000

CMD ["node", "server.js"]
