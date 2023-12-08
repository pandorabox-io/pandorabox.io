FROM alpine:3.19.0

# packages
RUN apk update &&\
    apk add --no-cache postgresql-client logrotate git

COPY . .
CMD ["/usr/sbin/crond", "-f"]