#FROM nginx:alpine
#COPY /dist/hello-world /usr/share/nginx/html
#ENTRYPOINT ["nginx","-g", "daemon off;"]
FROM node:10 AS builder
WORKDIR /app
COPY ..
RUN npm i && npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/dist/angular-nginx-docker .
ENTRYPOINT ["nginx","-g","daemon off;"]
