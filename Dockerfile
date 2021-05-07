FROM alpine/git:v2.30.1 as src
RUN git clone https://github.com/calendso/calendso.git /srv

FROM node:15-alpine3.13
WORKDIR /opt/app
COPY --from=src /srv/. .
RUN adduser -S app && \
    yarn install && \
    chown -R app .
USER app
EXPOSE 3000 5555

CMD ["yarn", "dev"]