FROM alpine:3.20.3

# packages
RUN apk update &&\
    apk add --no-cache postgresql-client logrotate git

COPY . .
CMD ["/usr/sbin/crond", "-f"]