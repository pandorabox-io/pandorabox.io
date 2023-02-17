#!/bin/sh
set -e

repo=$1
branch=$2

test -d "${repo}" || exit
cd $repo

test -z "${branch}" && branch=master

echo "checking ${repo}"

git remote update
git diff --exit-code HEAD origin/${branch} && exit

echo "updating ${repo}"

# checkout/pull branch
git checkout ${branch}
git pull origin ${branch}

# changed repo urls
git submodule sync

# updated commits
git submodule update --init --recursive

# removed directories
git clean -dff

echo "Update complete!"