#stage 1
FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g @angular/cli
RUN npm install -g serve
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/demo-app /usr/share/nginx/html