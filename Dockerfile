# Stage 1: Builder
FROM node:22-alpine AS builder
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN corepack enable
RUN pnpm install

# Copy project files
COPY . .

# Generate Prisma client
RUN pnpx prisma generate

# Build Svelte app
RUN pnpm run build

# Prune dev dependencies to reduce final image size
RUN pnpm prune --prod

# Stage 2: Production
FROM node:22-alpine
RUN corepack enable
WORKDIR /app

ENV NODE_ENV=production
ENV DATABASE_URL="file:/data/dev.db"

# Copy necessary files and folders from the builder
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY --from=builder /app/prisma prisma/
RUN mkdir /data
COPY --from=builder /app/prisma/dev.db /data/dev.db
COPY package.json .

# Generate Prisma client in production environment
RUN pnpm exec prisma generate
RUN pnpm exec prisma db push

# Set environment variables and expose port
EXPOSE 3000

# Run the application
CMD ["node", "build"]