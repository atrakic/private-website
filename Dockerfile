FROM node:alpine AS build
WORKDIR /app
ENV STATICRYPT_PASSWORD=aeTifUQPPfSPYprzjYuEC
COPY .staticrypt.json ./
RUN mkdir -p website
COPY <<EOF website/index.html
<h1>Hello, world!</h1>
EOF
RUN npm install -g staticrypt@3.*
RUN staticrypt -dr website

FROM lipanski/docker-static-website:latest AS final
COPY --from=0 /app/encrypted/website ./
