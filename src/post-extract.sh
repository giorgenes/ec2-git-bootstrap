#!/bin/bash

apt-get install git
export GIT_SSH=./git-ssh-wrap.sh
repo=$(mktemp -d /tmp/git-bootstrap.XXXXX)
git clone $(cat gitrepo) $repo
cd $repo
./run
