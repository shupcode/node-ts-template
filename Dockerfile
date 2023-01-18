FROM node:18-alpine as builder
WORKDIR /build
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:18-alpine
ENV NODE_ENV production
RUN mkdir /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
RUN npm install --omit-dev
COPY . .
COPY --from=builder --chown=node:node /build/build ./dist
USER node