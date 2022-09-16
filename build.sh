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

docker version
docker run --privileged --rm tonistiigi/binfmt --install all
sudo apt-get install docker-ce docker-ce-cli -y
docker run --privileged --rm tonistiigi/binfmt --install all

docker version


docker buildx ls
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx ls

uname -r



if [ "$1" == "release" ]; then
  javac -g:none Hello.java
else
  javac Hello.java
fi
java Hello
