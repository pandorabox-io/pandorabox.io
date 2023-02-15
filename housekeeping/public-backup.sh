#!/bin/sh
PGPASSWORD=enter pg_dump -U postgres | gzip > /backup/blocks.sql.gz