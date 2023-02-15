FROM alpine:3.17.2

RUN apk update &&\
    apk add --no-cache postgresql-client

COPY ./entrypoint.sh /
COPY ./public-backup.sh /etc/periodic/weekly/

CMD ["/entrypoint.sh"]