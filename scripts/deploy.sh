#!/bin/sh
# deployment script for automated updates via github actions

# ensure exclusive execution with flock
LOCK_FILE=/tmp/pandorabox-deployment.lock
exec 200>"$LOCK_FILE"
flock -n 200 || exit

# get latest repo version
git pull

# generate config from secret and public variables
./scripts/generate-config.sh

# pull latest versions of services (only those which track latest/master)
docker-compose pull wiki highscore manager

# update deployment
docker-compose up -d --remove-orphans

# cleanup old/stale images
docker image prune -af
