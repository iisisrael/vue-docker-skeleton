FROM node:21.2-alpine

WORKDIR /app

EXPOSE 8080

CMD [ "npm", "run", "serve" ]
