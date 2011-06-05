#!/bin/bash

if [ $# -lt 1 ]; then
	echo "$0 <data dir>"
	exit 1
fi

tmp=$(mktemp -d /tmp/gen-ec2-userdata.XXXXX)
echo $tmp

mkdir -p $tmp/data
cp -r $1/* $tmp/data/
cp src/post-extract.sh $tmp
tmptar=$(mktemp /tmp/gen-ec2-userdata.XXXXX.tar.gz)
tar -czf $tmptar -C $tmp .
(cat src/bootstrap.sh; cat $tmptar) > ec2-userdata.sh
rm $tmptar

echo "ec2-userdata.sh generated. Start a new ec2 instance"
echo "with that file as user data to boot strap chef"
