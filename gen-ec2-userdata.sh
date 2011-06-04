#!/bin/bash

if [ $# -lt 1 ]; then
	echo "$0 <git repo url> <path to ssh private key>"
	exit 1
fi

tmp=$(mktemp -d /tmp/gen-ec2-userdata.XXXXX)
echo $tmp

if [ $# -gt 1 ]; then
	cp $2 $tmp/sshkey
fi

cp -r data $tmp/
cp src/post-extract.sh $tmp
echo $1 > $tmp/gitrepo
tmptar=$(mktemp /tmp/gen-ec2-userdata.XXXXX.tar.gz)
tar -czf $tmptar -C $tmp .
(cat src/bootstrap.sh; cat $tmptar) > ec2-userdata.sh
rm $tmptar

echo "ec2-userdata.sh generated. Start a new ec2 instance"
echo "with that file as user data to boot strap chef"
