FROM node:22.14.0-alpine3.20 as ngapp-builder

WORKDIR /ngapp
COPY ngapp/*.json ./
RUN npm install --legacy-peer-deps
COPY ngapp/src ./src
RUN npm run build -- --output-path=./dist --configuration=production --output-hashing=all


FROM nginx:latest

COPY conf/default.conf /etc/nginx/conf.d/default.conf
RUN rm -rf /usr/share/nginx/html/*
COPY --from=ngapp-builder /ngapp/dist/* /usr/share/nginx/html
