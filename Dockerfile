FROM node:22-bookworm
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends bash ca-certificates curl wget git python3 python3-pip python3-venv build-essential make g++ unzip zip nano vim-tiny procps iproute2 openssh-client tmux tini && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY server.js ./server.js
COPY public ./public
RUN mkdir -p /workspace
ENV PORT=3000 WORKSPACE=/workspace
EXPOSE 3000
VOLUME ["/workspace"]
ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["node","server.js"]
