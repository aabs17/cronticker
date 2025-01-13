FROM node:19.2-alpine3.16 as deps
WORKDIR /app
COPY package.json ./
RUN npm install


FROM node:19.2-alpine3.16 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod


FROM node:19.2-alpine3.16 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test


FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY tasks/ ./tasks
COPY app.js ./
CMD [ "node", "app.js" ]