FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV production

# ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY ./next.config.mjs ./public ./package.json ./.next/standalone ./.next/static ./ 

USER nextjs
EXPOSE 3000
ENV PORT 3000

CMD ["node", "server.js"]