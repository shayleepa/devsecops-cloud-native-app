#===============
# Stage 1: Build and Dependencies
# ==============
FROM node:18-alpine AS builder

WORKDIR /usr/src/app

COPY package*json ./
RUN npm install --omit=dev

COPY . .

# =============
# Stage 2: Hardened Production Runtime
# ==============
FROM node:18-alpine AS runner

WORKDIR /usr/src/app

# Security Best Practice: Run as non-root user
USER node

# Copy dependencies and source from builder
COPY --chown=node:node --from=builder /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=builder /usr/src/app/package*.json ./
COPY --chown=node:node --from=builder /usr/src/app/src ./src

EXPOSE 3000

ENV NODE_ENV=production

CMD ["node", "src/server.js"]