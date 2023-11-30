FROM node:lts-alpine

RUN mkdir /app
WORKDIR /app

COPY package*.json ./

COPY . ./

RUN yarn

EXPOSE 3000

RUN yarn build

RUN yarn global add serve



CMD ["serve", "-s", "dist"]


