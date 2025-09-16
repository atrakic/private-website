FROM node:alpine AS build
WORKDIR /app
ENV STATICRYPT_PASSWORD=aeTifUQPPfSPYprzjYuEC
COPY .staticrypt.json ./
COPY plain ./plain
RUN npm install -g staticrypt@3.*
RUN staticrypt -dr plain

FROM lipanski/docker-static-website:latest AS final
COPY --from=0 /app/encrypted/plain ./
