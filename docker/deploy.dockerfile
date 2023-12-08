FROM node:21.2-alpine AS app-build

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build



FROM nginx:1.25

COPY --from=app-build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
