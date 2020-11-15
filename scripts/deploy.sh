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

# pull latest versions of services
docker-compose pull auth-proxy beerchat-proxy mapserver wiki highscore webmail manager

# update deployment
docker-compose up -d

# cleanup old/stale images
docker image prune -af
