#!/bin/bash

# Fail on any error.
set -e

# Display commands being run.
# WARNING: please only enable 'set -x' if necessary for debugging, and be very
#  careful if you handle credentials (e.g. from Keystore) with 'set -x':
#  statements like "export VAR=$(cat /tmp/keystore/credentials)" will result in
#  the credentials being printed in build logs.
#  Additionally, recursive invocation with credentials as command-line
#  parameters, will print the full command, with credentials, in the build logs.
# set -x
docker --version

sudo apt-get update && sudo apt-get install -yq gnupg2

docker --version

docker run --privileged --rm tonistiigi/binfmt --install all

docker buildx ls
sudo cat /etc/docker/daemon.json
sudo service docker stop
sudo service docker start --experimental
sudo cat ~/.docker/config.json

if [ "$1" == "release" ]; then
  javac -g:none Hello.java
else
  javac Hello.java
fi
java Hello
