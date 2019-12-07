FROM node:10

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    mysql-client

COPY . .

EXPOSE 8080

CMD ["node", "index.js"]