FROM alpine:3.17.2

# packages
RUN apk update &&\
    apk add --no-cache postgresql-client

# cron jobs, for reference:
# min   hour    day     month   weekday command
#*/15    *       *       *       *       run-parts /etc/periodic/15min
#0       *       *       *       *       run-parts /etc/periodic/hourly
#0       2       *       *       *       run-parts /etc/periodic/daily
#0       3       *       *       6       run-parts /etc/periodic/weekly
#0       5       1       *       *       run-parts /etc/periodic/monthly

COPY ./public-backup.sh /etc/periodic/weekly/

CMD ["/usr/sbin/crond", "-f"]