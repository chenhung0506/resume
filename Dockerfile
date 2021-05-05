FROM node:alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY module /usr/src/app
RUN yarn install && yarn cache clean
RUN yarn add bash 
RUN apk add curl
CMD node app.js
# CMD [ "yarn", "start" ]