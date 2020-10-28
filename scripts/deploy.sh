#!/bin/sh
# deployment script for automated updates via github actions

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
