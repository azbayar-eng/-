FROM node:22-bookworm-slim
WORKDIR /app
COPY baiyn-mend-server_2.zip /tmp/app.zip
RUN apt-get update && apt-get install -y --no-install-recommends unzip && unzip -q /tmp/app.zip -d /tmp/x && cp -a /tmp/x/baiyn-mend/. /app/ && rm -rf /tmp/x /tmp/app.zip && npm ci --omit=dev && apt-get purge -y --auto-remove unzip && rm -rf /var/lib/apt/lists/* /root/.npm
RUN mkdir -p /data
ENV NODE_ENV=production DATA_DIR=/data PORT=3000
EXPOSE 3000
CMD node server.js
