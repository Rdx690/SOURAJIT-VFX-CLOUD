FROM node:22-bookworm
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends bash ca-certificates curl wget git python3 python3-pip python3-venv build-essential make g++ unzip zip nano vim-tiny procps iproute2 openssh-client tmux tini && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm config set registry https://registry.npmjs.org/ \
 && npm config set fetch-retries 5 \
 && npm config set fetch-retry-mintimeout 20000 \
 && npm config set fetch-retry-maxtimeout 120000 \
 && npm config set fetch-timeout 300000 \
 && npm install --omit=dev
COPY server.js ./server.js
COPY public ./public
RUN mkdir -p /workspace
ENV PORT=3000 WORKSPACE=/workspace
EXPOSE 3000
VOLUME ["/workspace"]
ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["node","server.js"]
