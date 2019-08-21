#!/bin/sh

docker-compose exec postgres su postgres -c "/usr/lib/postgresql/10/bin/pg_ctl reload"
