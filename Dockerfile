FROM node:20-alpine AS base
LABEL org.opencontainers.image.title="gams-frontend" \
      org.opencontainers.image.description="GAMS React/Vite client" \
      org.opencontainers.image.source="https://github.com/c-joss/DEV1004_frontend_GAMS"
WORKDIR /usr/src/app
COPY package*.json ./

FROM base AS dev
ENV NODE_ENV=development
RUN npm install
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

FROM dev AS test
CMD ["npm", "test", "--", "--run"]