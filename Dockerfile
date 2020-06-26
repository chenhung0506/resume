FROM node:alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY module /usr/src/app
RUN yarn install && yarn cache clean
RUN yarn add bash
EXPOSE 3000
CMD node index.js
# CMD [ "yarn", "start" ]