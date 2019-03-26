#!/bin/sh
cat changecount_column.sql | sudo docker-compose exec postgres psql -U postgres
