#!/bin/bash

cd $(dirname $0)

###### Options ######
MEDIADIR=../data/nginx/html/media
#####################

die () {
	echo "$1" >&2
	exit 1
}

collect_from () {
	echo "Processing media from: $1"
	find -L "$1" -type f -name "*.png" -o -name "*.ogg" -o -name "*.x" -o -name "*.b3d" | while read f; do
		basename "$f"
		hash=`openssl dgst -sha1 <"$f" | cut -d " " -f 2`
		cp "$f" $MEDIADIR/$hash
	done
}

which openssl &>/dev/null || die "OpenSSL not installed."

mkdir -p $MEDIADIR

[ ! "$WORLDDIR" == none ] && collect_from "../data/minetest/world/worldmods"

printf "Creating index.mth... "
printf "MTHS\x00\x01" >$MEDIADIR/index.mth
find $MEDIADIR -type f -not -name index.mth | while read f; do
	openssl dgst -binary -sha1 <$f >>$MEDIADIR/index.mth
done
echo "done"

