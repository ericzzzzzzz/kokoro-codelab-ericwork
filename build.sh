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

sudo apt-get install docker-ce -y

docker version

ls /proc/sys/fs/binfmt_misc

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

docker buildx ls

uname -r

sudo apt-get install -y binfmt-support


if [ "$1" == "release" ]; then
  javac -g:none Hello.java
else
  javac Hello.java
fi
java Hello
