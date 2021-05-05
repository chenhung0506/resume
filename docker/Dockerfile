FROM node:alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN apk add bash && apk add curl
COPY app /usr/src/app
CMD node app.js
# CMD [ "yarn", "start" ]