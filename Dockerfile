FROM node:lts-alpine
WORKDIR /usr/src/app
COPY . .
EXPOSE 8080
RUN npm install
RUN npm rebuild node-sass
CMD [ "npm", "run", "serve" ]

