FROM alpine:3.17.2

# packages
RUN apk update &&\
    apk add --no-cache postgresql-client logrotate

COPY . .
CMD ["/usr/sbin/crond", "-f"]