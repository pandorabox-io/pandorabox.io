FROM alpine:3.22.0

# packages
RUN apk update &&\
    apk add --no-cache postgresql-client logrotate git bash

COPY . .
RUN chmod 755 /entrypoint.sh
CMD ["/entrypoint.sh"]
