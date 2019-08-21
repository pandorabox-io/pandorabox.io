FROM node:alpine

RUN apk add git

RUN mkdir /app
COPY index.js /app/index.js
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN cd /app && npm i

EXPOSE 8080

CMD ["node", "/app/index.js"]

