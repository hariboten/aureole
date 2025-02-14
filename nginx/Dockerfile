FROM node:22.14.0-alpine3.20 as ngapp-builder

WORKDIR /ngapp
COPY ngapp/*.json ./
RUN npm install --legacy-peer-deps
COPY ngapp/src ./src
RUN npm run build -- --output-path=./dist --configuration=production --output-hashing=all


FROM nginx:latest

ARG CPU_ARCH=amd64
ARG OAUTH2_PROXY_VERSION=7.8.1

RUN set -eux && \
	apt update && \
	apt install -y \
	supervisor wget gettext-base


RUN wget https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v${OAUTH2_PROXY_VERSION}/oauth2-proxy-v${OAUTH2_PROXY_VERSION}.linux-${CPU_ARCH}.tar.gz && \

     tar xf oauth2-proxy-v${OAUTH2_PROXY_VERSION}.linux-${CPU_ARCH}.tar.gz -C /usr/local/bin/ --strip-components 1 && \

     rm oauth2-proxy-v${OAUTH2_PROXY_VERSION}.linux-${CPU_ARCH}.tar.gz

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY conf/oauth2proxy.cfg.template /etc/oauth2proxy.cfg.template
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY startup.sh /startup.sh


RUN rm -rf /usr/share/nginx/html/*
COPY --from=ngapp-builder /ngapp/dist/* /usr/share/nginx/html

CMD ["bash", "startup.sh"]
