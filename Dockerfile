FROM nginx:1.17.1-alpine
COPY /dist/hello-world /usr/share/nginx/html
